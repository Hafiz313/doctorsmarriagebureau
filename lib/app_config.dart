var this_year = DateTime.now().year.toString();

class AppConfig {
  static String copyright_text = "@ PolytronX";
  // static String copyright_text = "@ ActiveItZone $this_year";
  static String copyright_link = "https://www.polytronx.com/";
  static String app_name = "Doctor Marriage Bureau";
  // static String app_name = "ACTIVE MATRIMONIAL";

  // enter string purchase_code here
  static String purshase_code = 'purchase-code';

  // configure this
  static const bool HTTPS = true;

  static const DOMAIN_PATH = "www.doctorsmarriagebureau.com"; //localhost

  // do not configure these below
  static const String API_ENDPATH = "api";
  static const String PROTOCOL = HTTPS ? "https://" : "http://";
  static const String RAW_BASE_URL = "${PROTOCOL}${DOMAIN_PATH}";
  static const String BASE_URL = "${RAW_BASE_URL}/${API_ENDPATH}";
}
