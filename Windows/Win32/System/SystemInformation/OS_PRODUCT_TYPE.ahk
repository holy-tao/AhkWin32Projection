#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemInformation
 */
class OS_PRODUCT_TYPE extends Win32Enum {

    /**
     * Native name: PRODUCT_UNDEFINED
     * @type {Integer (UInt32)}
     */
    static UNDEFINED => 0

    /**
     * Native name: PRODUCT_ULTIMATE
     * @type {Integer (UInt32)}
     */
    static ULTIMATE => 1

    /**
     * Native name: PRODUCT_HOME_BASIC
     * @type {Integer (UInt32)}
     */
    static HOME_BASIC => 2

    /**
     * Native name: PRODUCT_HOME_PREMIUM
     * @type {Integer (UInt32)}
     */
    static HOME_PREMIUM => 3

    /**
     * Native name: PRODUCT_ENTERPRISE
     * @type {Integer (UInt32)}
     */
    static ENTERPRISE => 4

    /**
     * Native name: PRODUCT_HOME_BASIC_N
     * @type {Integer (UInt32)}
     */
    static HOME_BASIC_N => 5

    /**
     * Native name: PRODUCT_BUSINESS
     * @type {Integer (UInt32)}
     */
    static BUSINESS => 6

    /**
     * Native name: PRODUCT_STANDARD_SERVER
     * @type {Integer (UInt32)}
     */
    static STANDARD_SERVER => 7

    /**
     * Native name: PRODUCT_DATACENTER_SERVER
     * @type {Integer (UInt32)}
     */
    static DATACENTER_SERVER => 8

    /**
     * Native name: PRODUCT_SMALLBUSINESS_SERVER
     * @type {Integer (UInt32)}
     */
    static SMALLBUSINESS_SERVER => 9

    /**
     * Native name: PRODUCT_ENTERPRISE_SERVER
     * @type {Integer (UInt32)}
     */
    static ENTERPRISE_SERVER => 10

    /**
     * Native name: PRODUCT_STARTER
     * @type {Integer (UInt32)}
     */
    static STARTER => 11

    /**
     * Native name: PRODUCT_DATACENTER_SERVER_CORE
     * @type {Integer (UInt32)}
     */
    static DATACENTER_SERVER_CORE => 12

    /**
     * Native name: PRODUCT_STANDARD_SERVER_CORE
     * @type {Integer (UInt32)}
     */
    static STANDARD_SERVER_CORE => 13

    /**
     * Native name: PRODUCT_ENTERPRISE_SERVER_CORE
     * @type {Integer (UInt32)}
     */
    static ENTERPRISE_SERVER_CORE => 14

    /**
     * Native name: PRODUCT_ENTERPRISE_SERVER_IA64
     * @type {Integer (UInt32)}
     */
    static ENTERPRISE_SERVER_IA64 => 15

    /**
     * Native name: PRODUCT_BUSINESS_N
     * @type {Integer (UInt32)}
     */
    static BUSINESS_N => 16

    /**
     * Native name: PRODUCT_WEB_SERVER
     * @type {Integer (UInt32)}
     */
    static WEB_SERVER => 17

    /**
     * Native name: PRODUCT_CLUSTER_SERVER
     * @type {Integer (UInt32)}
     */
    static CLUSTER_SERVER => 18

    /**
     * Native name: PRODUCT_HOME_SERVER
     * @type {Integer (UInt32)}
     */
    static HOME_SERVER => 19

    /**
     * Native name: PRODUCT_STORAGE_EXPRESS_SERVER
     * @type {Integer (UInt32)}
     */
    static STORAGE_EXPRESS_SERVER => 20

    /**
     * Native name: PRODUCT_STORAGE_STANDARD_SERVER
     * @type {Integer (UInt32)}
     */
    static STORAGE_STANDARD_SERVER => 21

    /**
     * Native name: PRODUCT_STORAGE_WORKGROUP_SERVER
     * @type {Integer (UInt32)}
     */
    static STORAGE_WORKGROUP_SERVER => 22

    /**
     * Native name: PRODUCT_STORAGE_ENTERPRISE_SERVER
     * @type {Integer (UInt32)}
     */
    static STORAGE_ENTERPRISE_SERVER => 23

    /**
     * Native name: PRODUCT_SERVER_FOR_SMALLBUSINESS
     * @type {Integer (UInt32)}
     */
    static SERVER_FOR_SMALLBUSINESS => 24

    /**
     * Native name: PRODUCT_SMALLBUSINESS_SERVER_PREMIUM
     * @type {Integer (UInt32)}
     */
    static SMALLBUSINESS_SERVER_PREMIUM => 25

    /**
     * Native name: PRODUCT_HOME_PREMIUM_N
     * @type {Integer (UInt32)}
     */
    static HOME_PREMIUM_N => 26

    /**
     * Native name: PRODUCT_ENTERPRISE_N
     * @type {Integer (UInt32)}
     */
    static ENTERPRISE_N => 27

    /**
     * Native name: PRODUCT_ULTIMATE_N
     * @type {Integer (UInt32)}
     */
    static ULTIMATE_N => 28

    /**
     * Native name: PRODUCT_WEB_SERVER_CORE
     * @type {Integer (UInt32)}
     */
    static WEB_SERVER_CORE => 29

    /**
     * Native name: PRODUCT_MEDIUMBUSINESS_SERVER_MANAGEMENT
     * @type {Integer (UInt32)}
     */
    static MEDIUMBUSINESS_SERVER_MANAGEMENT => 30

    /**
     * Native name: PRODUCT_MEDIUMBUSINESS_SERVER_SECURITY
     * @type {Integer (UInt32)}
     */
    static MEDIUMBUSINESS_SERVER_SECURITY => 31

    /**
     * Native name: PRODUCT_MEDIUMBUSINESS_SERVER_MESSAGING
     * @type {Integer (UInt32)}
     */
    static MEDIUMBUSINESS_SERVER_MESSAGING => 32

    /**
     * Native name: PRODUCT_SERVER_FOUNDATION
     * @type {Integer (UInt32)}
     */
    static SERVER_FOUNDATION => 33

    /**
     * Native name: PRODUCT_HOME_PREMIUM_SERVER
     * @type {Integer (UInt32)}
     */
    static HOME_PREMIUM_SERVER => 34

    /**
     * Native name: PRODUCT_SERVER_FOR_SMALLBUSINESS_V
     * @type {Integer (UInt32)}
     */
    static SERVER_FOR_SMALLBUSINESS_V => 35

    /**
     * Native name: PRODUCT_STANDARD_SERVER_V
     * @type {Integer (UInt32)}
     */
    static STANDARD_SERVER_V => 36

    /**
     * Native name: PRODUCT_DATACENTER_SERVER_V
     * @type {Integer (UInt32)}
     */
    static DATACENTER_SERVER_V => 37

    /**
     * Native name: PRODUCT_ENTERPRISE_SERVER_V
     * @type {Integer (UInt32)}
     */
    static ENTERPRISE_SERVER_V => 38

    /**
     * Native name: PRODUCT_DATACENTER_SERVER_CORE_V
     * @type {Integer (UInt32)}
     */
    static DATACENTER_SERVER_CORE_V => 39

    /**
     * Native name: PRODUCT_STANDARD_SERVER_CORE_V
     * @type {Integer (UInt32)}
     */
    static STANDARD_SERVER_CORE_V => 40

    /**
     * Native name: PRODUCT_ENTERPRISE_SERVER_CORE_V
     * @type {Integer (UInt32)}
     */
    static ENTERPRISE_SERVER_CORE_V => 41

    /**
     * Native name: PRODUCT_HYPERV
     * @type {Integer (UInt32)}
     */
    static HYPERV => 42

    /**
     * Native name: PRODUCT_STORAGE_EXPRESS_SERVER_CORE
     * @type {Integer (UInt32)}
     */
    static STORAGE_EXPRESS_SERVER_CORE => 43

    /**
     * Native name: PRODUCT_STORAGE_STANDARD_SERVER_CORE
     * @type {Integer (UInt32)}
     */
    static STORAGE_STANDARD_SERVER_CORE => 44

    /**
     * Native name: PRODUCT_STORAGE_WORKGROUP_SERVER_CORE
     * @type {Integer (UInt32)}
     */
    static STORAGE_WORKGROUP_SERVER_CORE => 45

    /**
     * Native name: PRODUCT_STORAGE_ENTERPRISE_SERVER_CORE
     * @type {Integer (UInt32)}
     */
    static STORAGE_ENTERPRISE_SERVER_CORE => 46

    /**
     * Native name: PRODUCT_STARTER_N
     * @type {Integer (UInt32)}
     */
    static STARTER_N => 47

    /**
     * Native name: PRODUCT_PROFESSIONAL
     * @type {Integer (UInt32)}
     */
    static PROFESSIONAL => 48

    /**
     * Native name: PRODUCT_PROFESSIONAL_N
     * @type {Integer (UInt32)}
     */
    static PROFESSIONAL_N => 49

    /**
     * Native name: PRODUCT_SB_SOLUTION_SERVER
     * @type {Integer (UInt32)}
     */
    static SB_SOLUTION_SERVER => 50

    /**
     * Native name: PRODUCT_SERVER_FOR_SB_SOLUTIONS
     * @type {Integer (UInt32)}
     */
    static SERVER_FOR_SB_SOLUTIONS => 51

    /**
     * Native name: PRODUCT_STANDARD_SERVER_SOLUTIONS
     * @type {Integer (UInt32)}
     */
    static STANDARD_SERVER_SOLUTIONS => 52

    /**
     * Native name: PRODUCT_STANDARD_SERVER_SOLUTIONS_CORE
     * @type {Integer (UInt32)}
     */
    static STANDARD_SERVER_SOLUTIONS_CORE => 53

    /**
     * Native name: PRODUCT_SB_SOLUTION_SERVER_EM
     * @type {Integer (UInt32)}
     */
    static SB_SOLUTION_SERVER_EM => 54

    /**
     * Native name: PRODUCT_SERVER_FOR_SB_SOLUTIONS_EM
     * @type {Integer (UInt32)}
     */
    static SERVER_FOR_SB_SOLUTIONS_EM => 55

    /**
     * Native name: PRODUCT_SOLUTION_EMBEDDEDSERVER
     * @type {Integer (UInt32)}
     */
    static SOLUTION_EMBEDDEDSERVER => 56

    /**
     * Native name: PRODUCT_SOLUTION_EMBEDDEDSERVER_CORE
     * @type {Integer (UInt32)}
     */
    static SOLUTION_EMBEDDEDSERVER_CORE => 57

    /**
     * Native name: PRODUCT_PROFESSIONAL_EMBEDDED
     * @type {Integer (UInt32)}
     */
    static PROFESSIONAL_EMBEDDED => 58

    /**
     * Native name: PRODUCT_ESSENTIALBUSINESS_SERVER_MGMT
     * @type {Integer (UInt32)}
     */
    static ESSENTIALBUSINESS_SERVER_MGMT => 59

    /**
     * Native name: PRODUCT_ESSENTIALBUSINESS_SERVER_ADDL
     * @type {Integer (UInt32)}
     */
    static ESSENTIALBUSINESS_SERVER_ADDL => 60

    /**
     * Native name: PRODUCT_ESSENTIALBUSINESS_SERVER_MGMTSVC
     * @type {Integer (UInt32)}
     */
    static ESSENTIALBUSINESS_SERVER_MGMTSVC => 61

    /**
     * Native name: PRODUCT_ESSENTIALBUSINESS_SERVER_ADDLSVC
     * @type {Integer (UInt32)}
     */
    static ESSENTIALBUSINESS_SERVER_ADDLSVC => 62

    /**
     * Native name: PRODUCT_SMALLBUSINESS_SERVER_PREMIUM_CORE
     * @type {Integer (UInt32)}
     */
    static SMALLBUSINESS_SERVER_PREMIUM_CORE => 63

    /**
     * Native name: PRODUCT_CLUSTER_SERVER_V
     * @type {Integer (UInt32)}
     */
    static CLUSTER_SERVER_V => 64

    /**
     * Native name: PRODUCT_EMBEDDED
     * @type {Integer (UInt32)}
     */
    static EMBEDDED => 65

    /**
     * Native name: PRODUCT_STARTER_E
     * @type {Integer (UInt32)}
     */
    static STARTER_E => 66

    /**
     * Native name: PRODUCT_HOME_BASIC_E
     * @type {Integer (UInt32)}
     */
    static HOME_BASIC_E => 67

    /**
     * Native name: PRODUCT_HOME_PREMIUM_E
     * @type {Integer (UInt32)}
     */
    static HOME_PREMIUM_E => 68

    /**
     * Native name: PRODUCT_PROFESSIONAL_E
     * @type {Integer (UInt32)}
     */
    static PROFESSIONAL_E => 69

    /**
     * Native name: PRODUCT_ENTERPRISE_E
     * @type {Integer (UInt32)}
     */
    static ENTERPRISE_E => 70

    /**
     * Native name: PRODUCT_ULTIMATE_E
     * @type {Integer (UInt32)}
     */
    static ULTIMATE_E => 71

    /**
     * Native name: PRODUCT_ENTERPRISE_EVALUATION
     * @type {Integer (UInt32)}
     */
    static ENTERPRISE_EVALUATION => 72

    /**
     * Native name: PRODUCT_MULTIPOINT_STANDARD_SERVER
     * @type {Integer (UInt32)}
     */
    static MULTIPOINT_STANDARD_SERVER => 76

    /**
     * Native name: PRODUCT_MULTIPOINT_PREMIUM_SERVER
     * @type {Integer (UInt32)}
     */
    static MULTIPOINT_PREMIUM_SERVER => 77

    /**
     * Native name: PRODUCT_STANDARD_EVALUATION_SERVER
     * @type {Integer (UInt32)}
     */
    static STANDARD_EVALUATION_SERVER => 79

    /**
     * Native name: PRODUCT_DATACENTER_EVALUATION_SERVER
     * @type {Integer (UInt32)}
     */
    static DATACENTER_EVALUATION_SERVER => 80

    /**
     * Native name: PRODUCT_ENTERPRISE_N_EVALUATION
     * @type {Integer (UInt32)}
     */
    static ENTERPRISE_N_EVALUATION => 84

    /**
     * Native name: PRODUCT_EMBEDDED_AUTOMOTIVE
     * @type {Integer (UInt32)}
     */
    static EMBEDDED_AUTOMOTIVE => 85

    /**
     * Native name: PRODUCT_EMBEDDED_INDUSTRY_A
     * @type {Integer (UInt32)}
     */
    static EMBEDDED_INDUSTRY_A => 86

    /**
     * Native name: PRODUCT_THINPC
     * @type {Integer (UInt32)}
     */
    static THINPC => 87

    /**
     * Native name: PRODUCT_EMBEDDED_A
     * @type {Integer (UInt32)}
     */
    static EMBEDDED_A => 88

    /**
     * Native name: PRODUCT_EMBEDDED_INDUSTRY
     * @type {Integer (UInt32)}
     */
    static EMBEDDED_INDUSTRY => 89

    /**
     * Native name: PRODUCT_EMBEDDED_E
     * @type {Integer (UInt32)}
     */
    static EMBEDDED_E => 90

    /**
     * Native name: PRODUCT_EMBEDDED_INDUSTRY_E
     * @type {Integer (UInt32)}
     */
    static EMBEDDED_INDUSTRY_E => 91

    /**
     * Native name: PRODUCT_EMBEDDED_INDUSTRY_A_E
     * @type {Integer (UInt32)}
     */
    static EMBEDDED_INDUSTRY_A_E => 92

    /**
     * Native name: PRODUCT_STORAGE_WORKGROUP_EVALUATION_SERVER
     * @type {Integer (UInt32)}
     */
    static STORAGE_WORKGROUP_EVALUATION_SERVER => 95

    /**
     * Native name: PRODUCT_STORAGE_STANDARD_EVALUATION_SERVER
     * @type {Integer (UInt32)}
     */
    static STORAGE_STANDARD_EVALUATION_SERVER => 96

    /**
     * Native name: PRODUCT_CORE_ARM
     * @type {Integer (UInt32)}
     */
    static CORE_ARM => 97

    /**
     * Native name: PRODUCT_CORE_N
     * @type {Integer (UInt32)}
     */
    static CORE_N => 98

    /**
     * Native name: PRODUCT_CORE_COUNTRYSPECIFIC
     * @type {Integer (UInt32)}
     */
    static CORE_COUNTRYSPECIFIC => 99

    /**
     * Native name: PRODUCT_CORE_SINGLELANGUAGE
     * @type {Integer (UInt32)}
     */
    static CORE_SINGLELANGUAGE => 100

    /**
     * Native name: PRODUCT_CORE
     * @type {Integer (UInt32)}
     */
    static CORE => 101

    /**
     * Native name: PRODUCT_PROFESSIONAL_WMC
     * @type {Integer (UInt32)}
     */
    static PROFESSIONAL_WMC => 103

    /**
     * Native name: PRODUCT_EMBEDDED_INDUSTRY_EVAL
     * @type {Integer (UInt32)}
     */
    static EMBEDDED_INDUSTRY_EVAL => 105

    /**
     * Native name: PRODUCT_EMBEDDED_INDUSTRY_E_EVAL
     * @type {Integer (UInt32)}
     */
    static EMBEDDED_INDUSTRY_E_EVAL => 106

    /**
     * Native name: PRODUCT_EMBEDDED_EVAL
     * @type {Integer (UInt32)}
     */
    static EMBEDDED_EVAL => 107

    /**
     * Native name: PRODUCT_EMBEDDED_E_EVAL
     * @type {Integer (UInt32)}
     */
    static EMBEDDED_E_EVAL => 108

    /**
     * Native name: PRODUCT_NANO_SERVER
     * @type {Integer (UInt32)}
     */
    static NANO_SERVER => 109

    /**
     * Native name: PRODUCT_CLOUD_STORAGE_SERVER
     * @type {Integer (UInt32)}
     */
    static CLOUD_STORAGE_SERVER => 110

    /**
     * Native name: PRODUCT_CORE_CONNECTED
     * @type {Integer (UInt32)}
     */
    static CORE_CONNECTED => 111

    /**
     * Native name: PRODUCT_PROFESSIONAL_STUDENT
     * @type {Integer (UInt32)}
     */
    static PROFESSIONAL_STUDENT => 112

    /**
     * Native name: PRODUCT_CORE_CONNECTED_N
     * @type {Integer (UInt32)}
     */
    static CORE_CONNECTED_N => 113

    /**
     * Native name: PRODUCT_PROFESSIONAL_STUDENT_N
     * @type {Integer (UInt32)}
     */
    static PROFESSIONAL_STUDENT_N => 114

    /**
     * Native name: PRODUCT_CORE_CONNECTED_SINGLELANGUAGE
     * @type {Integer (UInt32)}
     */
    static CORE_CONNECTED_SINGLELANGUAGE => 115

    /**
     * Native name: PRODUCT_CORE_CONNECTED_COUNTRYSPECIFIC
     * @type {Integer (UInt32)}
     */
    static CORE_CONNECTED_COUNTRYSPECIFIC => 116

    /**
     * Native name: PRODUCT_CONNECTED_CAR
     * @type {Integer (UInt32)}
     */
    static CONNECTED_CAR => 117

    /**
     * Native name: PRODUCT_INDUSTRY_HANDHELD
     * @type {Integer (UInt32)}
     */
    static INDUSTRY_HANDHELD => 118

    /**
     * Native name: PRODUCT_PPI_PRO
     * @type {Integer (UInt32)}
     */
    static PPI_PRO => 119

    /**
     * Native name: PRODUCT_ARM64_SERVER
     * @type {Integer (UInt32)}
     */
    static ARM64_SERVER => 120

    /**
     * Native name: PRODUCT_EDUCATION
     * @type {Integer (UInt32)}
     */
    static EDUCATION => 121

    /**
     * Native name: PRODUCT_EDUCATION_N
     * @type {Integer (UInt32)}
     */
    static EDUCATION_N => 122

    /**
     * Native name: PRODUCT_IOTUAP
     * @type {Integer (UInt32)}
     */
    static IOTUAP => 123

    /**
     * Native name: PRODUCT_CLOUD_HOST_INFRASTRUCTURE_SERVER
     * @type {Integer (UInt32)}
     */
    static CLOUD_HOST_INFRASTRUCTURE_SERVER => 124

    /**
     * Native name: PRODUCT_ENTERPRISE_S
     * @type {Integer (UInt32)}
     */
    static ENTERPRISE_S => 125

    /**
     * Native name: PRODUCT_ENTERPRISE_S_N
     * @type {Integer (UInt32)}
     */
    static ENTERPRISE_S_N => 126

    /**
     * Native name: PRODUCT_PROFESSIONAL_S
     * @type {Integer (UInt32)}
     */
    static PROFESSIONAL_S => 127

    /**
     * Native name: PRODUCT_PROFESSIONAL_S_N
     * @type {Integer (UInt32)}
     */
    static PROFESSIONAL_S_N => 128

    /**
     * Native name: PRODUCT_ENTERPRISE_S_EVALUATION
     * @type {Integer (UInt32)}
     */
    static ENTERPRISE_S_EVALUATION => 129

    /**
     * Native name: PRODUCT_ENTERPRISE_S_N_EVALUATION
     * @type {Integer (UInt32)}
     */
    static ENTERPRISE_S_N_EVALUATION => 130

    /**
     * Native name: PRODUCT_HOLOGRAPHIC
     * @type {Integer (UInt32)}
     */
    static HOLOGRAPHIC => 135

    /**
     * Native name: PRODUCT_HOLOGRAPHIC_BUSINESS
     * @type {Integer (UInt32)}
     */
    static HOLOGRAPHIC_BUSINESS => 136

    /**
     * Native name: PRODUCT_PRO_SINGLE_LANGUAGE
     * @type {Integer (UInt32)}
     */
    static PRO_SINGLE_LANGUAGE => 138

    /**
     * Native name: PRODUCT_PRO_CHINA
     * @type {Integer (UInt32)}
     */
    static PRO_CHINA => 139

    /**
     * Native name: PRODUCT_ENTERPRISE_SUBSCRIPTION
     * @type {Integer (UInt32)}
     */
    static ENTERPRISE_SUBSCRIPTION => 140

    /**
     * Native name: PRODUCT_ENTERPRISE_SUBSCRIPTION_N
     * @type {Integer (UInt32)}
     */
    static ENTERPRISE_SUBSCRIPTION_N => 141

    /**
     * Native name: PRODUCT_DATACENTER_NANO_SERVER
     * @type {Integer (UInt32)}
     */
    static DATACENTER_NANO_SERVER => 143

    /**
     * Native name: PRODUCT_STANDARD_NANO_SERVER
     * @type {Integer (UInt32)}
     */
    static STANDARD_NANO_SERVER => 144

    /**
     * Native name: PRODUCT_DATACENTER_A_SERVER_CORE
     * @type {Integer (UInt32)}
     */
    static DATACENTER_A_SERVER_CORE => 145

    /**
     * Native name: PRODUCT_STANDARD_A_SERVER_CORE
     * @type {Integer (UInt32)}
     */
    static STANDARD_A_SERVER_CORE => 146

    /**
     * Native name: PRODUCT_DATACENTER_WS_SERVER_CORE
     * @type {Integer (UInt32)}
     */
    static DATACENTER_WS_SERVER_CORE => 147

    /**
     * Native name: PRODUCT_STANDARD_WS_SERVER_CORE
     * @type {Integer (UInt32)}
     */
    static STANDARD_WS_SERVER_CORE => 148

    /**
     * Native name: PRODUCT_UTILITY_VM
     * @type {Integer (UInt32)}
     */
    static UTILITY_VM => 149

    /**
     * Native name: PRODUCT_DATACENTER_EVALUATION_SERVER_CORE
     * @type {Integer (UInt32)}
     */
    static DATACENTER_EVALUATION_SERVER_CORE => 159

    /**
     * Native name: PRODUCT_STANDARD_EVALUATION_SERVER_CORE
     * @type {Integer (UInt32)}
     */
    static STANDARD_EVALUATION_SERVER_CORE => 160

    /**
     * Native name: PRODUCT_PRO_WORKSTATION
     * @type {Integer (UInt32)}
     */
    static PRO_WORKSTATION => 161

    /**
     * Native name: PRODUCT_PRO_WORKSTATION_N
     * @type {Integer (UInt32)}
     */
    static PRO_WORKSTATION_N => 162

    /**
     * Native name: PRODUCT_PRO_FOR_EDUCATION
     * @type {Integer (UInt32)}
     */
    static PRO_FOR_EDUCATION => 164

    /**
     * Native name: PRODUCT_PRO_FOR_EDUCATION_N
     * @type {Integer (UInt32)}
     */
    static PRO_FOR_EDUCATION_N => 165

    /**
     * Native name: PRODUCT_AZURE_SERVER_CORE
     * @type {Integer (UInt32)}
     */
    static AZURE_SERVER_CORE => 168

    /**
     * Native name: PRODUCT_AZURE_NANO_SERVER
     * @type {Integer (UInt32)}
     */
    static AZURE_NANO_SERVER => 169

    /**
     * Native name: PRODUCT_ENTERPRISEG
     * @type {Integer (UInt32)}
     */
    static ENTERPRISEG => 171

    /**
     * Native name: PRODUCT_ENTERPRISEGN
     * @type {Integer (UInt32)}
     */
    static ENTERPRISEGN => 172

    /**
     * Native name: PRODUCT_SERVERRDSH
     * @type {Integer (UInt32)}
     */
    static SERVERRDSH => 175

    /**
     * Native name: PRODUCT_CLOUD
     * @type {Integer (UInt32)}
     */
    static CLOUD => 178

    /**
     * Native name: PRODUCT_CLOUDN
     * @type {Integer (UInt32)}
     */
    static CLOUDN => 179

    /**
     * Native name: PRODUCT_HUBOS
     * @type {Integer (UInt32)}
     */
    static HUBOS => 180

    /**
     * Native name: PRODUCT_ONECOREUPDATEOS
     * @type {Integer (UInt32)}
     */
    static ONECOREUPDATEOS => 182

    /**
     * Native name: PRODUCT_CLOUDE
     * @type {Integer (UInt32)}
     */
    static CLOUDE => 183

    /**
     * Native name: PRODUCT_IOTOS
     * @type {Integer (UInt32)}
     */
    static IOTOS => 185

    /**
     * Native name: PRODUCT_CLOUDEN
     * @type {Integer (UInt32)}
     */
    static CLOUDEN => 186

    /**
     * Native name: PRODUCT_IOTEDGEOS
     * @type {Integer (UInt32)}
     */
    static IOTEDGEOS => 187

    /**
     * Native name: PRODUCT_IOTENTERPRISE
     * @type {Integer (UInt32)}
     */
    static IOTENTERPRISE => 188

    /**
     * Native name: PRODUCT_LITE
     * @type {Integer (UInt32)}
     */
    static LITE => 189

    /**
     * Native name: PRODUCT_IOTENTERPRISES
     * @type {Integer (UInt32)}
     */
    static IOTENTERPRISES => 191

    /**
     * Native name: PRODUCT_XBOX_SYSTEMOS
     * @type {Integer (UInt32)}
     */
    static XBOX_SYSTEMOS => 192

    /**
     * Native name: PRODUCT_XBOX_GAMEOS
     * @type {Integer (UInt32)}
     */
    static XBOX_GAMEOS => 194

    /**
     * Native name: PRODUCT_XBOX_ERAOS
     * @type {Integer (UInt32)}
     */
    static XBOX_ERAOS => 195

    /**
     * Native name: PRODUCT_XBOX_DURANGOHOSTOS
     * @type {Integer (UInt32)}
     */
    static XBOX_DURANGOHOSTOS => 196

    /**
     * Native name: PRODUCT_XBOX_SCARLETTHOSTOS
     * @type {Integer (UInt32)}
     */
    static XBOX_SCARLETTHOSTOS => 197

    /**
     * Native name: PRODUCT_XBOX_KEYSTONE
     * @type {Integer (UInt32)}
     */
    static XBOX_KEYSTONE => 198

    /**
     * Native name: PRODUCT_AZURE_SERVER_CLOUDHOST
     * @type {Integer (UInt32)}
     */
    static AZURE_SERVER_CLOUDHOST => 199

    /**
     * Native name: PRODUCT_AZURE_SERVER_CLOUDMOS
     * @type {Integer (UInt32)}
     */
    static AZURE_SERVER_CLOUDMOS => 200

    /**
     * Native name: PRODUCT_CLOUDEDITIONN
     * @type {Integer (UInt32)}
     */
    static CLOUDEDITIONN => 202

    /**
     * Native name: PRODUCT_CLOUDEDITION
     * @type {Integer (UInt32)}
     */
    static CLOUDEDITION => 203

    /**
     * Native name: PRODUCT_VALIDATION
     * @type {Integer (UInt32)}
     */
    static VALIDATION => 204

    /**
     * Native name: PRODUCT_IOTENTERPRISESK
     * @type {Integer (UInt32)}
     */
    static IOTENTERPRISESK => 205

    /**
     * Native name: PRODUCT_IOTENTERPRISEK
     * @type {Integer (UInt32)}
     */
    static IOTENTERPRISEK => 206

    /**
     * Native name: PRODUCT_IOTENTERPRISESEVAL
     * @type {Integer (UInt32)}
     */
    static IOTENTERPRISESEVAL => 207

    /**
     * Native name: PRODUCT_AZURE_SERVER_AGENTBRIDGE
     * @type {Integer (UInt32)}
     */
    static AZURE_SERVER_AGENTBRIDGE => 208

    /**
     * Native name: PRODUCT_AZURE_SERVER_NANOHOST
     * @type {Integer (UInt32)}
     */
    static AZURE_SERVER_NANOHOST => 209

    /**
     * Native name: PRODUCT_WNC
     * @type {Integer (UInt32)}
     */
    static WNC => 210

    /**
     * Native name: PRODUCT_AZURESTACKHCI_SERVER_CORE
     * @type {Integer (UInt32)}
     */
    static AZURESTACKHCI_SERVER_CORE => 406

    /**
     * Native name: PRODUCT_DATACENTER_SERVER_AZURE_EDITION
     * @type {Integer (UInt32)}
     */
    static DATACENTER_SERVER_AZURE_EDITION => 407

    /**
     * Native name: PRODUCT_DATACENTER_SERVER_CORE_AZURE_EDITION
     * @type {Integer (UInt32)}
     */
    static DATACENTER_SERVER_CORE_AZURE_EDITION => 408

    /**
     * Native name: PRODUCT_DATACENTER_WS_SERVER_CORE_AZURE_EDITION
     * @type {Integer (UInt32)}
     */
    static DATACENTER_WS_SERVER_CORE_AZURE_EDITION => 409

    /**
     * Native name: PRODUCT_UNLICENSED
     * @type {Integer (UInt32)}
     */
    static UNLICENSED => 2882382797
}
