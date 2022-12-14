# ### Generate pictures from tables
# ## percentage_rows_kept
# # width = 221
# # height = 226
# # Mild
# data_combined_tidy %>%
#   dplyr::filter(is_binder == TRUE) %>%
#   percentage_rows_kept() %>%
#   gt::gt() %>%
#   gt::cols_label(donor = gt::md("**donor**"),
#                  percentage_left = gt::md("**percentage_left**"))
#
# # Strict
# data_combined_tidy %>%
#   evaluate_binder(UMI_count_min = 40) %>%
#   dplyr::filter(is_binder == TRUE,
#                 HLA_match == "TRUE") %>%
#   percentage_rows_kept() %>%
#   gt::gt() %>%
#   gt::cols_label(donor = gt::md("**donor**"),
#                  percentage_left = gt::md("**percentage_left**")) %>%
#   gt::fmt_number(columns = percentage_left,
#                  decimals = 2)
#
# ## summarise_with_filter
# # width = 301, 907
# # height = 339, 339
#
# # Mild
# data_combined_tidy %>%
#   dplyr::filter(donor == "donor1") %>%
#   dplyr::filter(is_binder == TRUE) %>%
#   summarise_with_filter(summarise_by = c("allele")) %>%
#   gt::gt() %>%
#   gt::cols_label(allele = gt::md("**allele**"),
#                  donor1_old = gt::md("**donor1_old**"),
#                  donor1_new = gt::md("**donor1_new**")
#   )
#
# data_combined_tidy %>%
#   dplyr::filter(is_binder == TRUE) %>%
#   summarise_with_filter(summarise_by = c("allele")) %>%
#   gt::gt() %>%
#   gt::cols_label(allele = gt::md("**allele**"),
#                  donor1_old = gt::md("**donor1_old**"),
#                  donor2_old = gt::md("**donor2_old**"),
#                  donor3_old = gt::md("**donor3_old**"),
#                  donor4_old = gt::md("**donor4_old**"),
#                  donor1_new = gt::md("**donor1_new**"),
#                  donor2_new = gt::md("**donor2_new**"),
#                  donor3_new = gt::md("**donor3_new**"),
#                  donor4_new = gt::md("**donor4_new**")
#   )
#
# # Strict
# data_combined_tidy %>%
#   dplyr::filter(donor == "donor1") %>%
#   evaluate_binder(UMI_count_min = 40) %>%
#   dplyr::filter(is_binder == TRUE,
#                 HLA_match == "TRUE") %>%
#   summarise_with_filter(summarise_by = c("allele")) %>%
#   gt::gt() %>%
#   gt::cols_label(allele = gt::md("**allele**"),
#                  donor1_old = gt::md("**donor1_old**"),
#                  donor1_new = gt::md("**donor1_new**"))
#
# data_combined_tidy %>%
#   evaluate_binder(UMI_count_min = 40) %>%
#   dplyr::filter(is_binder == TRUE,
#                 HLA_match == "TRUE") %>%
#   summarise_with_filter(summarise_by = c("allele")) %>%
#   gt::gt() %>%
#   gt::cols_label(allele = gt::md("**allele**"),
#                  donor1_old = gt::md("**donor1_old**"),
#                  donor2_old = gt::md("**donor2_old**"),
#                  donor3_old = gt::md("**donor3_old**"),
#                  donor4_old = gt::md("**donor4_old**"),
#                  donor1_new = gt::md("**donor1_new**"),
#                  donor2_new = gt::md("**donor2_new**"),
#                  donor3_new = gt::md("**donor3_new**"),
#                  donor4_new = gt::md("**donor4_new**")
#   )
#
#
# ### Generate pictures from most functions
#
# ## boxplot_protein_expressions
#
# for (protein in data_combined_tidy %>%
#      dplyr::select(dplyr::matches("CD|HLA.DR")) %>%
#      colnames() %>%
#      make.names()) {
#   # Mild filter
#   data_combined_tidy %>%
#     dplyr::filter(is_binder == TRUE) %>%
#     boxplot_protein_expressions(plot_protein = protein)
#
#   ggplot2::ggsave(stringr::str_c("boxplot_protein_expressions_mild_", protein, ".png"),
#                   path = "C:\\Users\\William\\OneDrive - Danmarks Tekniske Universitet\\Bachelor\\Pictures",
#                   dpi = 400, scale = 0.7, width = 7, height = 5.5)
#
#
#   # Strict filter
#   data_combined_tidy %>%
#     dplyr::filter(is_binder == TRUE,
#                   HLA_match == "TRUE") %>%
#     boxplot_protein_expressions(plot_protein = protein)
#
#   ggplot2::ggsave(stringr::str_c("boxplot_protein_expressions_strict_", protein, ".png"),
#                   path = "C:\\Users\\William\\OneDrive - Danmarks Tekniske Universitet\\Bachelor\\Pictures",
#                   dpi = 400, scale = 0.7, width = 7, height = 5.5)
# }
#
# ##  alpha_beta_sequence_distinctiveness
# # Mild filter
# data_combined_tidy %>%
#   dplyr::filter(donor == "donor1") %>%
#   dplyr::filter(is_binder == TRUE) %>%
#   alpha_beta_sequence_distinctiveness()
#
# ggplot2::ggsave("alpha_beta_sequence_distinctiveness_mild_donor_one.png",
#                 path = "C:\\Users\\William\\OneDrive - Danmarks Tekniske Universitet\\Bachelor\\Pictures",
#                 dpi = 400, scale = 0.5, width = 7)
#
# data_combined_tidy %>%
#   dplyr::filter(is_binder == TRUE) %>%
#   alpha_beta_sequence_distinctiveness()
#
# ggplot2::ggsave("alpha_beta_sequence_distinctiveness_mild_all.png",
#                 path = "C:\\Users\\William\\OneDrive - Danmarks Tekniske Universitet\\Bachelor\\Pictures",
#                 dpi = 400, scale = 0.65)
#
#
# # Strict filter
# data_combined_tidy %>%
#   dplyr::filter(donor == "donor1") %>%
#   evaluate_binder(UMI_count_min = 40,
#                   negative_control_UMI_count_min = 30) %>%
#   dplyr::filter(is_binder == TRUE) %>%
#   alpha_beta_sequence_distinctiveness()
#
# ggplot2::ggsave("alpha_beta_sequence_distinctiveness_strict_donor_one.png",
#                 path = "C:\\Users\\William\\OneDrive - Danmarks Tekniske Universitet\\Bachelor\\Pictures",
#                 dpi = 400, scale = 0.5, width = 7)
#
# data_combined_tidy %>%
#   evaluate_binder(UMI_count_min = 40,
#                   negative_control_UMI_count_min = 30) %>%
#   dplyr::filter(is_binder == TRUE) %>%
#   alpha_beta_sequence_distinctiveness()
#
# ggplot2::ggsave("alpha_beta_sequence_distinctiveness_strict_all.png",
#                 path = "C:\\Users\\William\\OneDrive - Danmarks Tekniske Universitet\\Bachelor\\Pictures",
#                 dpi = 400, scale = 0.65)
#
# ##  alpha_beta_category_distribution
# # Mild filter
# data_combined_tidy %>%
#   dplyr::filter(donor == "donor1") %>%
#   dplyr::filter(is_binder == TRUE) %>%
#   alpha_beta_category_distribution()
#
# ggplot2::ggsave("alpha_beta_category_distribution_mild_donor_one.png",
#                 path = "C:\\Users\\William\\OneDrive - Danmarks Tekniske Universitet\\Bachelor\\Pictures",
#                 dpi = 400, scale = 0.5, width = 7)
#
# data_combined_tidy %>%
#   dplyr::filter(is_binder == TRUE) %>%
#   alpha_beta_category_distribution()
#
# ggplot2::ggsave("alpha_beta_category_distribution_mild_all.png",
#                 path = "C:\\Users\\William\\OneDrive - Danmarks Tekniske Universitet\\Bachelor\\Pictures",
#                 dpi = 400, scale = 0.65)
#
#
# # Strict filter
# data_combined_tidy %>%
#   dplyr::filter(donor == "donor1") %>%
#   evaluate_binder(UMI_count_min = 40) %>%
#   dplyr::filter(is_binder == TRUE,
#                 HLA_match == "TRUE") %>%
#   alpha_beta_category_distribution()
#
# ggplot2::ggsave("alpha_beta_category_distribution_strict_donor_one.png",
#                 path = "C:\\Users\\William\\OneDrive - Danmarks Tekniske Universitet\\Bachelor\\Pictures",
#                 dpi = 400, scale = 0.5, width = 7)
#
# data_combined_tidy %>%
#   evaluate_binder(UMI_count_min = 40) %>%
#   dplyr::filter(is_binder == TRUE,
#                 HLA_match == "TRUE") %>%
#   alpha_beta_category_distribution()
#
# ggplot2::ggsave("alpha_beta_category_distribution_strict_all.png",
#                 path = "C:\\Users\\William\\OneDrive - Danmarks Tekniske Universitet\\Bachelor\\Pictures",
#                 dpi = 400, scale = 0.65)
#
# ##  count_binding_pr_allele
# # Mild filter
# # Remember to correct limits of y-axis
# data_combined_tidy %>%
#   dplyr::filter(donor == "donor1") %>%
#   dplyr::filter(is_binder == TRUE) %>%
#   count_binding_pr_allele()
#
# ggplot2::ggsave("count_binding_pr_allele_mild_donor_one.png",
#                 path = "C:\\Users\\William\\OneDrive - Danmarks Tekniske Universitet\\Bachelor\\Pictures",
#                 dpi = 400, scale = 0.5)
#
# data_combined_tidy %>%
#   dplyr::filter(is_binder == TRUE) %>%
#   count_binding_pr_allele()
#
# ggplot2::ggsave("count_binding_pr_allele_mild_all.png",
#                 path = "C:\\Users\\William\\OneDrive - Danmarks Tekniske Universitet\\Bachelor\\Pictures",
#                 dpi = 400, scale = 0.8)
#
#
# # Strict filter
# # Remember to correct limits of y-axis
# data_combined_tidy %>%
#   dplyr::filter(donor == "donor1") %>%
#   evaluate_binder(UMI_count_min = 40) %>%
#   dplyr::filter(is_binder == TRUE,
#                 HLA_match == "TRUE") %>%
#   count_binding_pr_allele()
#
# ggplot2::ggsave("count_binding_pr_allele_strict_donor_one.png",
#                 path = "C:\\Users\\William\\OneDrive - Danmarks Tekniske Universitet\\Bachelor\\Pictures",
#                 dpi = 400, scale = 0.5)
#
# data_combined_tidy %>%
#   evaluate_binder(UMI_count_min = 40) %>%
#   dplyr::filter(is_binder == TRUE,
#                 HLA_match == "TRUE") %>%
#   count_binding_pr_allele()
#
# ggplot2::ggsave("count_binding_pr_allele_strict_all.png",
#                 path = "C:\\Users\\William\\OneDrive - Danmarks Tekniske Universitet\\Bachelor\\Pictures",
#                 dpi = 400, scale = 0.65)
#
# ##  relevant_binders_plot
# # Mild filter
# data_combined_tidy %>%
#   dplyr::filter(donor == "donor1") %>%
#   dplyr::filter(is_binder == TRUE) %>%
#   relevant_binders_plot(plotly_option = FALSE)
#
# ggplot2::ggsave("relevant_binders_plot_mild_donor_one.png",
#                 path = "C:\\Users\\William\\OneDrive - Danmarks Tekniske Universitet\\Bachelor\\Pictures",
#                 dpi = 400)
#
# data_combined_tidy %>%
#   dplyr::filter(is_binder == TRUE) %>%
#   relevant_binders_plot(plotly_option = FALSE)
#
# ggplot2::ggsave("relevant_binders_plot_mild_all.png",
#                 path = "C:\\Users\\William\\OneDrive - Danmarks Tekniske Universitet\\Bachelor\\Pictures",
#                 dpi = 400, height = 16)
#
#
# # Strict filter
# data_combined_tidy %>%
#   dplyr::filter(donor == "donor1") %>%
#   evaluate_binder(UMI_count_min = 40) %>%
#   dplyr::filter(is_binder == TRUE,
#                 HLA_match == "TRUE") %>%
#   relevant_binders_plot(plotly_option = FALSE)
#
# ggplot2::ggsave("relevant_binders_plot_strict_donor_one.png",
#                 path = "C:\\Users\\William\\OneDrive - Danmarks Tekniske Universitet\\Bachelor\\Pictures",
#                 dpi = 400)
#
# data_combined_tidy %>%
#   evaluate_binder(UMI_count_min = 40) %>%
#   dplyr::filter(is_binder == TRUE,
#                 HLA_match == "TRUE") %>%
#   relevant_binders_plot(plotly_option = FALSE)
#
# ggplot2::ggsave("relevant_binders_plot_strict_all.png",
#                 path = "C:\\Users\\William\\OneDrive - Danmarks Tekniske Universitet\\Bachelor\\Pictures",
#                 dpi = 400, height = 16)
#
# data_combined_tidy %>%
#   evaluate_binder(UMI_count_min = 40) %>%
#   dplyr::filter(is_binder == TRUE) %>%
#   relevant_binders_plot(plotly_option = FALSE)
#
# ggplot2::ggsave("relevant_binders_plot_less_strict_all.png",
#                 path = "C:\\Users\\William\\OneDrive - Danmarks Tekniske Universitet\\Bachelor\\Pictures",
#                 dpi = 400, height = 16)
#
# ### Generate pictures from UMAP
# # Fjern inner loop for at f?? alle donors i samme plot
#
# for (protein in data_combined_tidy %>%
#                     dplyr::select(dplyr::matches("CD|HLA-DR")) %>%
#                     colnames() %>%
#                     make.names()) {
#   for (chosen_donor in ImmunoCleaner::data_combined_tidy %>%
#         dplyr::distinct(donor) %>%
#         dplyr::pull()) {
#
#   data_combined_tidy %>%
#     dplyr::filter(donor == chosen_donor) %>%
#     #dplyr::slice_head(n = 100) %>%
#     umap_of_protein_expressions(color_by = protein)
#
#   ggplot2::ggsave(stringr::str_c("umap_of_protein_expressions_", protein,"_", chosen_donor, ".png"),
#                   path = "C:\\Users\\William\\OneDrive - Danmarks Tekniske Universitet\\Bachelor\\Pictures",
#                   dpi = 400, scale = 0.5, width = 9, height = 6, units = "in")
#   }
# }
#
#
# ### Generate cover picture
# # Add the following to theme() in relevant_binders_plot:
# # panel.background = ggplot2::element_rect(fill = "transparent"),
# # plot.background = ggplot2::element_rect(fill = "transparent"),
# # legend.background = ggplot2::element_rect(fill = "transparent"),
# # legend.box.background = ggplot2::element_rect(fill = "transparent"),
# # legend.key = ggplot2::element_rect(fill = "transparent"),
# # strip.background = ggplot2::element_blank(),
# # strip.text.x = ggplot2::element_blank(),
# # text = ggplot2::element_text(size = 7,
# #                              color = "white"),
# # axis.text = ggplot2::element_text(size = 7,
# #                                   color = "white"),
# # axis.ticks.y = ggplot2::element_line(color = "white")
#
# data_combined_tidy %>%
#   dplyr::filter(donor == "donor1",
#                 HLA_match == "TRUE") %>%
#   evaluate_binder(UMI_count_min = 40) %>%
#   dplyr::filter(is_binder == TRUE) %>%
#   relevant_binders_plot(plotly_option = FALSE)
#
# ggplot2::ggsave("cover_picture.png",
#                 path = "C:\\Users\\William\\OneDrive - Danmarks Tekniske Universitet\\Bachelor\\Pictures",
#                 scale = 0.6,
#                 bg = "steelblue")
#
# # Another example
# umap_model <- ImmunoCleaner::data_combined_tidy %>%
#   dplyr::filter(donor == "donor4") %>%
#   dplyr::distinct(barcode,
#                   .keep_all = TRUE) %>%
#   dplyr::select(dplyr::matches("CD|HLA-DR")) %>%
#   #dplyr::slice_head(n = 100) %>%
#   as.matrix() %>%
#   uwot::umap(n_neighbors = 15,
#              min_dist = 0.2,
#              metric = "euclidean",
#              ret_model = TRUE)
#
#
# data_combined_tidy_temp <- data_combined_tidy %>%
#   dplyr::filter(donor == "donor4") %>%
#   dplyr::distinct(barcode,
#                   .keep_all = TRUE) %>%
#   #dplyr::slice_head(n = 100) %>%
#   dplyr::select(dplyr::matches("CD|HLA-DR"))
#
# umap_embed <- data_combined_tidy_temp %>%
#   dplyr::select(dplyr::matches("CD|HLA-DR")) %>%
#   uwot::umap_transform(model = umap_model) %>%
#   as.data.frame() %>%
#   tibble::as_tibble()
#
#
# umap_coords <- dplyr::bind_cols(umap_embed,
#                                 data_combined_tidy_temp)
#
# umap_coords %>%
#   ggplot2::ggplot(ggplot2::aes(x = V1,
#                                y = V2,
#                                color = CD45RA)) +
#   ggplot2::geom_point() +
#   ggplot2::scale_color_continuous(type = "viridis",
#                                   direction = -1) +
#   ggplot2::theme(
#     axis.ticks = ggplot2::element_blank(),
#     axis.text = ggplot2::element_blank(),
#     axis.title = ggplot2::element_blank(),
#     panel.grid = ggplot2::element_blank(),
#     panel.border = ggplot2::element_blank(),
#     panel.background = ggplot2::element_rect(fill = "transparent"),
#     plot.background = ggplot2::element_rect(fill = "transparent"),
#     legend.position = "none",
#     strip.background = ggplot2::element_blank(),
#   )
#
# ggplot2::ggsave("cover_picture_2.png",
#                 path = "C:\\Users\\William\\OneDrive - Danmarks Tekniske Universitet\\Bachelor\\Pictures",
#                 bg = "transparent")
#
#
#
# ### For presentation
# x <- tibble::tribble(~Cell, ~CD8a, ~CD3, ~CD45RA,
#                      "A", 43, 43, 14,
#                      "B", 50, 43, 7,
#                      "C", 43, 37, 20,
#                      "D", 39, 42, 19,
#                      "E", 40, 46, 14)
#
# x %>%
#   tidyr::pivot_longer(cols = dplyr::matches("CD"),
#                       names_to = "Protein",
#                       values_to = "Composition") %>%
#   ggplot2::ggplot(ggplot2::aes(x = Cell,
#                                y = Composition,
#                                fill = Protein)) +
#   ggplot2::geom_bar(position = "stack",
#                     stat = "identity", width = 0.5) +
#   ggplot2::labs(
#     title = "Mock protein expression data"
#   )
#
# ggplot2::ggsave("mock_compositional_data.png",
#                 path = "C:\\Users\\William\\OneDrive - Danmarks Tekniske Universitet\\Bachelor\\Pictures",
#                 scale = 0.5)
