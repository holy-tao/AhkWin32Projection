#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.SystemInformation
 * @version v4.0.30319
 */
class OS_PRODUCT_TYPE{

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_UNDEFINED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_ULTIMATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_HOME_BASIC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_HOME_PREMIUM => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_ENTERPRISE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_HOME_BASIC_N => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_BUSINESS => 6

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_STANDARD_SERVER => 7

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_DATACENTER_SERVER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_SMALLBUSINESS_SERVER => 9

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_ENTERPRISE_SERVER => 10

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_STARTER => 11

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_DATACENTER_SERVER_CORE => 12

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_STANDARD_SERVER_CORE => 13

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_ENTERPRISE_SERVER_CORE => 14

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_ENTERPRISE_SERVER_IA64 => 15

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_BUSINESS_N => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_WEB_SERVER => 17

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_CLUSTER_SERVER => 18

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_HOME_SERVER => 19

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_STORAGE_EXPRESS_SERVER => 20

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_STORAGE_STANDARD_SERVER => 21

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_STORAGE_WORKGROUP_SERVER => 22

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_STORAGE_ENTERPRISE_SERVER => 23

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_SERVER_FOR_SMALLBUSINESS => 24

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_SMALLBUSINESS_SERVER_PREMIUM => 25

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_HOME_PREMIUM_N => 26

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_ENTERPRISE_N => 27

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_ULTIMATE_N => 28

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_WEB_SERVER_CORE => 29

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_MEDIUMBUSINESS_SERVER_MANAGEMENT => 30

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_MEDIUMBUSINESS_SERVER_SECURITY => 31

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_MEDIUMBUSINESS_SERVER_MESSAGING => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_SERVER_FOUNDATION => 33

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_HOME_PREMIUM_SERVER => 34

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_SERVER_FOR_SMALLBUSINESS_V => 35

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_STANDARD_SERVER_V => 36

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_DATACENTER_SERVER_V => 37

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_ENTERPRISE_SERVER_V => 38

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_DATACENTER_SERVER_CORE_V => 39

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_STANDARD_SERVER_CORE_V => 40

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_ENTERPRISE_SERVER_CORE_V => 41

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_HYPERV => 42

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_STORAGE_EXPRESS_SERVER_CORE => 43

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_STORAGE_STANDARD_SERVER_CORE => 44

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_STORAGE_WORKGROUP_SERVER_CORE => 45

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_STORAGE_ENTERPRISE_SERVER_CORE => 46

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_STARTER_N => 47

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_PROFESSIONAL => 48

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_PROFESSIONAL_N => 49

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_SB_SOLUTION_SERVER => 50

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_SERVER_FOR_SB_SOLUTIONS => 51

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_STANDARD_SERVER_SOLUTIONS => 52

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_STANDARD_SERVER_SOLUTIONS_CORE => 53

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_SB_SOLUTION_SERVER_EM => 54

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_SERVER_FOR_SB_SOLUTIONS_EM => 55

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_SOLUTION_EMBEDDEDSERVER => 56

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_SOLUTION_EMBEDDEDSERVER_CORE => 57

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_PROFESSIONAL_EMBEDDED => 58

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_ESSENTIALBUSINESS_SERVER_MGMT => 59

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_ESSENTIALBUSINESS_SERVER_ADDL => 60

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_ESSENTIALBUSINESS_SERVER_MGMTSVC => 61

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_ESSENTIALBUSINESS_SERVER_ADDLSVC => 62

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_SMALLBUSINESS_SERVER_PREMIUM_CORE => 63

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_CLUSTER_SERVER_V => 64

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_EMBEDDED => 65

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_STARTER_E => 66

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_HOME_BASIC_E => 67

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_HOME_PREMIUM_E => 68

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_PROFESSIONAL_E => 69

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_ENTERPRISE_E => 70

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_ULTIMATE_E => 71

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_ENTERPRISE_EVALUATION => 72

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_MULTIPOINT_STANDARD_SERVER => 76

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_MULTIPOINT_PREMIUM_SERVER => 77

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_STANDARD_EVALUATION_SERVER => 79

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_DATACENTER_EVALUATION_SERVER => 80

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_ENTERPRISE_N_EVALUATION => 84

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_EMBEDDED_AUTOMOTIVE => 85

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_EMBEDDED_INDUSTRY_A => 86

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_THINPC => 87

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_EMBEDDED_A => 88

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_EMBEDDED_INDUSTRY => 89

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_EMBEDDED_E => 90

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_EMBEDDED_INDUSTRY_E => 91

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_EMBEDDED_INDUSTRY_A_E => 92

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_STORAGE_WORKGROUP_EVALUATION_SERVER => 95

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_STORAGE_STANDARD_EVALUATION_SERVER => 96

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_CORE_ARM => 97

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_CORE_N => 98

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_CORE_COUNTRYSPECIFIC => 99

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_CORE_SINGLELANGUAGE => 100

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_CORE => 101

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_PROFESSIONAL_WMC => 103

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_EMBEDDED_INDUSTRY_EVAL => 105

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_EMBEDDED_INDUSTRY_E_EVAL => 106

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_EMBEDDED_EVAL => 107

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_EMBEDDED_E_EVAL => 108

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_NANO_SERVER => 109

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_CLOUD_STORAGE_SERVER => 110

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_CORE_CONNECTED => 111

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_PROFESSIONAL_STUDENT => 112

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_CORE_CONNECTED_N => 113

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_PROFESSIONAL_STUDENT_N => 114

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_CORE_CONNECTED_SINGLELANGUAGE => 115

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_CORE_CONNECTED_COUNTRYSPECIFIC => 116

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_CONNECTED_CAR => 117

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_INDUSTRY_HANDHELD => 118

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_PPI_PRO => 119

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_ARM64_SERVER => 120

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_EDUCATION => 121

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_EDUCATION_N => 122

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_IOTUAP => 123

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_CLOUD_HOST_INFRASTRUCTURE_SERVER => 124

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_ENTERPRISE_S => 125

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_ENTERPRISE_S_N => 126

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_PROFESSIONAL_S => 127

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_PROFESSIONAL_S_N => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_ENTERPRISE_S_EVALUATION => 129

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_ENTERPRISE_S_N_EVALUATION => 130

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_HOLOGRAPHIC => 135

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_HOLOGRAPHIC_BUSINESS => 136

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_PRO_SINGLE_LANGUAGE => 138

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_PRO_CHINA => 139

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_ENTERPRISE_SUBSCRIPTION => 140

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_ENTERPRISE_SUBSCRIPTION_N => 141

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_DATACENTER_NANO_SERVER => 143

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_STANDARD_NANO_SERVER => 144

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_DATACENTER_A_SERVER_CORE => 145

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_STANDARD_A_SERVER_CORE => 146

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_DATACENTER_WS_SERVER_CORE => 147

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_STANDARD_WS_SERVER_CORE => 148

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_UTILITY_VM => 149

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_DATACENTER_EVALUATION_SERVER_CORE => 159

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_STANDARD_EVALUATION_SERVER_CORE => 160

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_PRO_WORKSTATION => 161

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_PRO_WORKSTATION_N => 162

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_PRO_FOR_EDUCATION => 164

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_PRO_FOR_EDUCATION_N => 165

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_AZURE_SERVER_CORE => 168

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_AZURE_NANO_SERVER => 169

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_ENTERPRISEG => 171

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_ENTERPRISEGN => 172

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_SERVERRDSH => 175

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_CLOUD => 178

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_CLOUDN => 179

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_HUBOS => 180

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_ONECOREUPDATEOS => 182

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_CLOUDE => 183

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_IOTOS => 185

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_CLOUDEN => 186

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_IOTEDGEOS => 187

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_IOTENTERPRISE => 188

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_LITE => 189

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_IOTENTERPRISES => 191

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_XBOX_SYSTEMOS => 192

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_XBOX_GAMEOS => 194

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_XBOX_ERAOS => 195

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_XBOX_DURANGOHOSTOS => 196

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_XBOX_SCARLETTHOSTOS => 197

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_XBOX_KEYSTONE => 198

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_AZURE_SERVER_CLOUDHOST => 199

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_AZURE_SERVER_CLOUDMOS => 200

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_CLOUDEDITIONN => 202

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_CLOUDEDITION => 203

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_VALIDATION => 204

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_IOTENTERPRISESK => 205

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_IOTENTERPRISEK => 206

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_IOTENTERPRISESEVAL => 207

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_AZURE_SERVER_AGENTBRIDGE => 208

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_AZURE_SERVER_NANOHOST => 209

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_WNC => 210

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_AZURESTACKHCI_SERVER_CORE => 406

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_DATACENTER_SERVER_AZURE_EDITION => 407

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_DATACENTER_SERVER_CORE_AZURE_EDITION => 408

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_DATACENTER_WS_SERVER_CORE_AZURE_EDITION => 409

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_UNLICENSED => 2882382797
}
