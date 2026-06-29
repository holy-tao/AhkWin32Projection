#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct HIDP_CAPS {
    #StructPack 2

    Usage : UInt16

    UsagePage : UInt16

    InputReportByteLength : UInt16

    OutputReportByteLength : UInt16

    FeatureReportByteLength : UInt16

    Reserved : UInt16[17]

    NumberLinkCollectionNodes : UInt16

    NumberInputButtonCaps : UInt16

    NumberInputValueCaps : UInt16

    NumberInputDataIndices : UInt16

    NumberOutputButtonCaps : UInt16

    NumberOutputValueCaps : UInt16

    NumberOutputDataIndices : UInt16

    NumberFeatureButtonCaps : UInt16

    NumberFeatureValueCaps : UInt16

    NumberFeatureDataIndices : UInt16

}
