#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\HIDP_VALUE_CAPS.ahk" { HIDP_VALUE_CAPS }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\PHIDP_PREPARSED_DATA.ahk" { PHIDP_PREPARSED_DATA }
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\HIDP_CAPS.ahk" { HIDP_CAPS }
#Import ".\USAGE_AND_PAGE.ahk" { USAGE_AND_PAGE }
#Import ".\HIDP_KEYBOARD_MODIFIER_STATE.ahk" { HIDP_KEYBOARD_MODIFIER_STATE }
#Import ".\HIDP_BUTTON_CAPS.ahk" { HIDP_BUTTON_CAPS }
#Import ".\HIDP_DATA.ahk" { HIDP_DATA }
#Import ".\HIDP_KEYBOARD_DIRECTION.ahk" { HIDP_KEYBOARD_DIRECTION }
#Import ".\HIDP_REPORT_TYPE.ahk" { HIDP_REPORT_TYPE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\HIDD_ATTRIBUTES.ahk" { HIDD_ATTRIBUTES }
#Import ".\HIDP_BUTTON_ARRAY_DATA.ahk" { HIDP_BUTTON_ARRAY_DATA }
#Import ".\HIDP_EXTENDED_ATTRIBUTES.ahk" { HIDP_EXTENDED_ATTRIBUTES }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\HIDP_LINK_COLLECTION_NODE.ahk" { HIDP_LINK_COLLECTION_NODE }
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */

;@region Functions
/**
 * 
 * @param {HINSTANCE} hinst 
 * @param {Integer} dwVersion 
 * @param {Pointer<Guid>} riidltf 
 * @param {Pointer<Pointer<Void>>} ppvOut 
 * @param {IUnknown} punkOuter 
 * @returns {HRESULT} 
 */
export DirectInput8Create(hinst, dwVersion, riidltf, ppvOut, punkOuter) {
    ppvOutMarshal := ppvOut is VarRef ? "ptr*" : "ptr"

    result := DllCall("DINPUT8.dll\DirectInput8Create", HINSTANCE, hinst, "uint", dwVersion, Guid.Ptr, riidltf, ppvOutMarshal, ppvOut, "ptr", punkOuter, "HRESULT")
    return result
}

/**
 * The joyConfigChanged function informs the joystick driver that the configuration has changed and should be reloaded from the registry.
 * @remarks
 * This function causes a window message to be sent to all top-level windows. This message may be defined by applications that need to respond to changes in joystick calibration by using <b>RegisterWindowMessage</b> with the following message ID:
 * 
 * 
 * ```cpp
 * @param {Integer} dwFlags Reserved for future use. Must equal zero.
 * @returns {Integer} Returns JOYERR_NOERROR if successful. Returns JOYERR_PARMS if the parameter is non-zero.
 * @see https://learn.microsoft.com/windows/win32/api/joystickapi/nf-joystickapi-joyconfigchanged
 * @since windows5.0
 */
export joyConfigChanged(dwFlags) {
    result := DllCall("WINMM.dll\joyConfigChanged", "uint", dwFlags, UInt32)
    return result
}

/**
 * 
 * @param {PHIDP_PREPARSED_DATA} PreparsedData 
 * @param {Pointer<HIDP_CAPS>} Capabilities 
 * @returns {NTSTATUS} 
 */
export HidP_GetCaps(PreparsedData, Capabilities) {
    result := DllCall("HID.dll\HidP_GetCaps", PHIDP_PREPARSED_DATA, PreparsedData, HIDP_CAPS.Ptr, Capabilities, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HIDP_LINK_COLLECTION_NODE>} LinkCollectionNodes 
 * @param {Pointer<Integer>} LinkCollectionNodesLength 
 * @param {PHIDP_PREPARSED_DATA} PreparsedData 
 * @returns {NTSTATUS} 
 */
export HidP_GetLinkCollectionNodes(LinkCollectionNodes, LinkCollectionNodesLength, PreparsedData) {
    LinkCollectionNodesLengthMarshal := LinkCollectionNodesLength is VarRef ? "uint*" : "ptr"

    result := DllCall("HID.dll\HidP_GetLinkCollectionNodes", HIDP_LINK_COLLECTION_NODE.Ptr, LinkCollectionNodes, LinkCollectionNodesLengthMarshal, LinkCollectionNodesLength, PHIDP_PREPARSED_DATA, PreparsedData, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HIDP_REPORT_TYPE} ReportType 
 * @param {Integer} UsagePage 
 * @param {Integer} LinkCollection 
 * @param {Integer} Usage 
 * @param {Pointer<HIDP_BUTTON_CAPS>} ButtonCaps 
 * @param {Pointer<Integer>} ButtonCapsLength 
 * @param {PHIDP_PREPARSED_DATA} PreparsedData 
 * @returns {NTSTATUS} 
 */
export HidP_GetSpecificButtonCaps(ReportType, UsagePage, LinkCollection, Usage, ButtonCaps, ButtonCapsLength, PreparsedData) {
    ButtonCapsLengthMarshal := ButtonCapsLength is VarRef ? "ushort*" : "ptr"

    result := DllCall("HID.dll\HidP_GetSpecificButtonCaps", HIDP_REPORT_TYPE, ReportType, "ushort", UsagePage, "ushort", LinkCollection, "ushort", Usage, HIDP_BUTTON_CAPS.Ptr, ButtonCaps, ButtonCapsLengthMarshal, ButtonCapsLength, PHIDP_PREPARSED_DATA, PreparsedData, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HIDP_REPORT_TYPE} ReportType 
 * @param {Pointer<HIDP_BUTTON_CAPS>} ButtonCaps 
 * @param {Pointer<Integer>} ButtonCapsLength 
 * @param {PHIDP_PREPARSED_DATA} PreparsedData 
 * @returns {NTSTATUS} 
 */
export HidP_GetButtonCaps(ReportType, ButtonCaps, ButtonCapsLength, PreparsedData) {
    ButtonCapsLengthMarshal := ButtonCapsLength is VarRef ? "ushort*" : "ptr"

    result := DllCall("HID.dll\HidP_GetButtonCaps", HIDP_REPORT_TYPE, ReportType, HIDP_BUTTON_CAPS.Ptr, ButtonCaps, ButtonCapsLengthMarshal, ButtonCapsLength, PHIDP_PREPARSED_DATA, PreparsedData, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HIDP_REPORT_TYPE} ReportType 
 * @param {Integer} UsagePage 
 * @param {Integer} LinkCollection 
 * @param {Integer} Usage 
 * @param {Pointer<HIDP_VALUE_CAPS>} ValueCaps 
 * @param {Pointer<Integer>} ValueCapsLength 
 * @param {PHIDP_PREPARSED_DATA} PreparsedData 
 * @returns {NTSTATUS} 
 */
export HidP_GetSpecificValueCaps(ReportType, UsagePage, LinkCollection, Usage, ValueCaps, ValueCapsLength, PreparsedData) {
    ValueCapsLengthMarshal := ValueCapsLength is VarRef ? "ushort*" : "ptr"

    result := DllCall("HID.dll\HidP_GetSpecificValueCaps", HIDP_REPORT_TYPE, ReportType, "ushort", UsagePage, "ushort", LinkCollection, "ushort", Usage, HIDP_VALUE_CAPS.Ptr, ValueCaps, ValueCapsLengthMarshal, ValueCapsLength, PHIDP_PREPARSED_DATA, PreparsedData, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HIDP_REPORT_TYPE} ReportType 
 * @param {Pointer<HIDP_VALUE_CAPS>} ValueCaps 
 * @param {Pointer<Integer>} ValueCapsLength 
 * @param {PHIDP_PREPARSED_DATA} PreparsedData 
 * @returns {NTSTATUS} 
 */
export HidP_GetValueCaps(ReportType, ValueCaps, ValueCapsLength, PreparsedData) {
    ValueCapsLengthMarshal := ValueCapsLength is VarRef ? "ushort*" : "ptr"

    result := DllCall("HID.dll\HidP_GetValueCaps", HIDP_REPORT_TYPE, ReportType, HIDP_VALUE_CAPS.Ptr, ValueCaps, ValueCapsLengthMarshal, ValueCapsLength, PHIDP_PREPARSED_DATA, PreparsedData, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HIDP_REPORT_TYPE} ReportType 
 * @param {Integer} DataIndex 
 * @param {PHIDP_PREPARSED_DATA} PreparsedData 
 * @param {Pointer<HIDP_EXTENDED_ATTRIBUTES>} Attributes 
 * @param {Pointer<Integer>} LengthAttributes 
 * @returns {NTSTATUS} 
 */
export HidP_GetExtendedAttributes(ReportType, DataIndex, PreparsedData, Attributes, LengthAttributes) {
    LengthAttributesMarshal := LengthAttributes is VarRef ? "uint*" : "ptr"

    result := DllCall("HID.dll\HidP_GetExtendedAttributes", HIDP_REPORT_TYPE, ReportType, "ushort", DataIndex, PHIDP_PREPARSED_DATA, PreparsedData, HIDP_EXTENDED_ATTRIBUTES.Ptr, Attributes, LengthAttributesMarshal, LengthAttributes, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HIDP_REPORT_TYPE} ReportType 
 * @param {Integer} ReportID 
 * @param {PHIDP_PREPARSED_DATA} PreparsedData 
 * @param {Integer} Report 
 * @param {Integer} ReportLength 
 * @returns {NTSTATUS} 
 */
export HidP_InitializeReportForID(ReportType, ReportID, PreparsedData, Report, ReportLength) {
    result := DllCall("HID.dll\HidP_InitializeReportForID", HIDP_REPORT_TYPE, ReportType, "char", ReportID, PHIDP_PREPARSED_DATA, PreparsedData, "ptr", Report, "uint", ReportLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HIDP_REPORT_TYPE} ReportType 
 * @param {Pointer<HIDP_DATA>} DataList 
 * @param {Pointer<Integer>} DataLength 
 * @param {PHIDP_PREPARSED_DATA} PreparsedData 
 * @param {Integer} Report 
 * @param {Integer} ReportLength 
 * @returns {NTSTATUS} 
 */
export HidP_SetData(ReportType, DataList, DataLength, PreparsedData, Report, ReportLength) {
    DataLengthMarshal := DataLength is VarRef ? "uint*" : "ptr"

    result := DllCall("HID.dll\HidP_SetData", HIDP_REPORT_TYPE, ReportType, HIDP_DATA.Ptr, DataList, DataLengthMarshal, DataLength, PHIDP_PREPARSED_DATA, PreparsedData, "ptr", Report, "uint", ReportLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HIDP_REPORT_TYPE} ReportType 
 * @param {Pointer<HIDP_DATA>} DataList 
 * @param {Pointer<Integer>} DataLength 
 * @param {PHIDP_PREPARSED_DATA} PreparsedData 
 * @param {Integer} Report 
 * @param {Integer} ReportLength 
 * @returns {NTSTATUS} 
 */
export HidP_GetData(ReportType, DataList, DataLength, PreparsedData, Report, ReportLength) {
    DataLengthMarshal := DataLength is VarRef ? "uint*" : "ptr"

    result := DllCall("HID.dll\HidP_GetData", HIDP_REPORT_TYPE, ReportType, HIDP_DATA.Ptr, DataList, DataLengthMarshal, DataLength, PHIDP_PREPARSED_DATA, PreparsedData, "ptr", Report, "uint", ReportLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HIDP_REPORT_TYPE} ReportType 
 * @param {PHIDP_PREPARSED_DATA} PreparsedData 
 * @returns {Integer} 
 */
export HidP_MaxDataListLength(ReportType, PreparsedData) {
    result := DllCall("HID.dll\HidP_MaxDataListLength", HIDP_REPORT_TYPE, ReportType, PHIDP_PREPARSED_DATA, PreparsedData, UInt32)
    return result
}

/**
 * 
 * @param {HIDP_REPORT_TYPE} ReportType 
 * @param {Integer} UsagePage 
 * @param {Integer} LinkCollection 
 * @param {Pointer<Integer>} UsageList 
 * @param {Pointer<Integer>} UsageLength 
 * @param {PHIDP_PREPARSED_DATA} PreparsedData 
 * @param {Integer} Report 
 * @param {Integer} ReportLength 
 * @returns {NTSTATUS} 
 */
export HidP_SetUsages(ReportType, UsagePage, LinkCollection, UsageList, UsageLength, PreparsedData, Report, ReportLength) {
    UsageListMarshal := UsageList is VarRef ? "ushort*" : "ptr"
    UsageLengthMarshal := UsageLength is VarRef ? "uint*" : "ptr"

    result := DllCall("HID.dll\HidP_SetUsages", HIDP_REPORT_TYPE, ReportType, "ushort", UsagePage, "ushort", LinkCollection, UsageListMarshal, UsageList, UsageLengthMarshal, UsageLength, PHIDP_PREPARSED_DATA, PreparsedData, "ptr", Report, "uint", ReportLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HIDP_REPORT_TYPE} ReportType 
 * @param {Integer} UsagePage 
 * @param {Integer} LinkCollection 
 * @param {Pointer<Integer>} UsageList 
 * @param {Pointer<Integer>} UsageLength 
 * @param {PHIDP_PREPARSED_DATA} PreparsedData 
 * @param {Integer} Report 
 * @param {Integer} ReportLength 
 * @returns {NTSTATUS} 
 */
export HidP_UnsetUsages(ReportType, UsagePage, LinkCollection, UsageList, UsageLength, PreparsedData, Report, ReportLength) {
    UsageListMarshal := UsageList is VarRef ? "ushort*" : "ptr"
    UsageLengthMarshal := UsageLength is VarRef ? "uint*" : "ptr"

    result := DllCall("HID.dll\HidP_UnsetUsages", HIDP_REPORT_TYPE, ReportType, "ushort", UsagePage, "ushort", LinkCollection, UsageListMarshal, UsageList, UsageLengthMarshal, UsageLength, PHIDP_PREPARSED_DATA, PreparsedData, "ptr", Report, "uint", ReportLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HIDP_REPORT_TYPE} ReportType 
 * @param {Integer} UsagePage 
 * @param {Integer} LinkCollection 
 * @param {Pointer<Integer>} UsageList 
 * @param {Pointer<Integer>} UsageLength 
 * @param {PHIDP_PREPARSED_DATA} PreparsedData 
 * @param {Integer} Report 
 * @param {Integer} ReportLength 
 * @returns {NTSTATUS} 
 */
export HidP_GetUsages(ReportType, UsagePage, LinkCollection, UsageList, UsageLength, PreparsedData, Report, ReportLength) {
    UsageListMarshal := UsageList is VarRef ? "ushort*" : "ptr"
    UsageLengthMarshal := UsageLength is VarRef ? "uint*" : "ptr"

    result := DllCall("HID.dll\HidP_GetUsages", HIDP_REPORT_TYPE, ReportType, "ushort", UsagePage, "ushort", LinkCollection, UsageListMarshal, UsageList, UsageLengthMarshal, UsageLength, PHIDP_PREPARSED_DATA, PreparsedData, "ptr", Report, "uint", ReportLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HIDP_REPORT_TYPE} ReportType 
 * @param {Integer} LinkCollection 
 * @param {Pointer<USAGE_AND_PAGE>} ButtonList 
 * @param {Pointer<Integer>} UsageLength 
 * @param {PHIDP_PREPARSED_DATA} PreparsedData 
 * @param {Integer} Report 
 * @param {Integer} ReportLength 
 * @returns {NTSTATUS} 
 */
export HidP_GetUsagesEx(ReportType, LinkCollection, ButtonList, UsageLength, PreparsedData, Report, ReportLength) {
    UsageLengthMarshal := UsageLength is VarRef ? "uint*" : "ptr"

    result := DllCall("HID.dll\HidP_GetUsagesEx", HIDP_REPORT_TYPE, ReportType, "ushort", LinkCollection, USAGE_AND_PAGE.Ptr, ButtonList, UsageLengthMarshal, UsageLength, PHIDP_PREPARSED_DATA, PreparsedData, "ptr", Report, "uint", ReportLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HIDP_REPORT_TYPE} ReportType 
 * @param {Integer} UsagePage 
 * @param {PHIDP_PREPARSED_DATA} PreparsedData 
 * @returns {Integer} 
 */
export HidP_MaxUsageListLength(ReportType, UsagePage, PreparsedData) {
    result := DllCall("HID.dll\HidP_MaxUsageListLength", HIDP_REPORT_TYPE, ReportType, "ushort", UsagePage, PHIDP_PREPARSED_DATA, PreparsedData, UInt32)
    return result
}

/**
 * 
 * @param {HIDP_REPORT_TYPE} ReportType 
 * @param {Integer} UsagePage 
 * @param {Integer} LinkCollection 
 * @param {Integer} Usage 
 * @param {Integer} UsageValue 
 * @param {PHIDP_PREPARSED_DATA} PreparsedData 
 * @param {Integer} Report 
 * @param {Integer} ReportLength 
 * @returns {NTSTATUS} 
 */
export HidP_SetUsageValue(ReportType, UsagePage, LinkCollection, Usage, UsageValue, PreparsedData, Report, ReportLength) {
    result := DllCall("HID.dll\HidP_SetUsageValue", HIDP_REPORT_TYPE, ReportType, "ushort", UsagePage, "ushort", LinkCollection, "ushort", Usage, "uint", UsageValue, PHIDP_PREPARSED_DATA, PreparsedData, "ptr", Report, "uint", ReportLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HIDP_REPORT_TYPE} ReportType 
 * @param {Integer} UsagePage 
 * @param {Integer} LinkCollection 
 * @param {Integer} Usage 
 * @param {Integer} UsageValue 
 * @param {PHIDP_PREPARSED_DATA} PreparsedData 
 * @param {Integer} Report 
 * @param {Integer} ReportLength 
 * @returns {NTSTATUS} 
 */
export HidP_SetScaledUsageValue(ReportType, UsagePage, LinkCollection, Usage, UsageValue, PreparsedData, Report, ReportLength) {
    result := DllCall("HID.dll\HidP_SetScaledUsageValue", HIDP_REPORT_TYPE, ReportType, "ushort", UsagePage, "ushort", LinkCollection, "ushort", Usage, "int", UsageValue, PHIDP_PREPARSED_DATA, PreparsedData, "ptr", Report, "uint", ReportLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HIDP_REPORT_TYPE} ReportType 
 * @param {Integer} UsagePage 
 * @param {Integer} LinkCollection 
 * @param {Integer} Usage 
 * @param {Integer} UsageValue 
 * @param {Integer} UsageValueByteLength 
 * @param {PHIDP_PREPARSED_DATA} PreparsedData 
 * @param {Integer} Report 
 * @param {Integer} ReportLength 
 * @returns {NTSTATUS} 
 */
export HidP_SetUsageValueArray(ReportType, UsagePage, LinkCollection, Usage, UsageValue, UsageValueByteLength, PreparsedData, Report, ReportLength) {
    result := DllCall("HID.dll\HidP_SetUsageValueArray", HIDP_REPORT_TYPE, ReportType, "ushort", UsagePage, "ushort", LinkCollection, "ushort", Usage, "ptr", UsageValue, "ushort", UsageValueByteLength, PHIDP_PREPARSED_DATA, PreparsedData, "ptr", Report, "uint", ReportLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HIDP_REPORT_TYPE} ReportType 
 * @param {Integer} UsagePage 
 * @param {Integer} LinkCollection 
 * @param {Integer} Usage 
 * @param {Pointer<Integer>} UsageValue 
 * @param {PHIDP_PREPARSED_DATA} PreparsedData 
 * @param {Integer} Report 
 * @param {Integer} ReportLength 
 * @returns {NTSTATUS} 
 */
export HidP_GetUsageValue(ReportType, UsagePage, LinkCollection, Usage, UsageValue, PreparsedData, Report, ReportLength) {
    UsageValueMarshal := UsageValue is VarRef ? "uint*" : "ptr"

    result := DllCall("HID.dll\HidP_GetUsageValue", HIDP_REPORT_TYPE, ReportType, "ushort", UsagePage, "ushort", LinkCollection, "ushort", Usage, UsageValueMarshal, UsageValue, PHIDP_PREPARSED_DATA, PreparsedData, "ptr", Report, "uint", ReportLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HIDP_REPORT_TYPE} ReportType 
 * @param {Integer} UsagePage 
 * @param {Integer} LinkCollection 
 * @param {Integer} Usage 
 * @param {Pointer<Integer>} UsageValue 
 * @param {PHIDP_PREPARSED_DATA} PreparsedData 
 * @param {Integer} Report 
 * @param {Integer} ReportLength 
 * @returns {NTSTATUS} 
 */
export HidP_GetScaledUsageValue(ReportType, UsagePage, LinkCollection, Usage, UsageValue, PreparsedData, Report, ReportLength) {
    UsageValueMarshal := UsageValue is VarRef ? "int*" : "ptr"

    result := DllCall("HID.dll\HidP_GetScaledUsageValue", HIDP_REPORT_TYPE, ReportType, "ushort", UsagePage, "ushort", LinkCollection, "ushort", Usage, UsageValueMarshal, UsageValue, PHIDP_PREPARSED_DATA, PreparsedData, "ptr", Report, "uint", ReportLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HIDP_REPORT_TYPE} ReportType 
 * @param {Integer} UsagePage 
 * @param {Integer} LinkCollection 
 * @param {Integer} Usage 
 * @param {Integer} UsageValue 
 * @param {Integer} UsageValueByteLength 
 * @param {PHIDP_PREPARSED_DATA} PreparsedData 
 * @param {Integer} Report 
 * @param {Integer} ReportLength 
 * @returns {NTSTATUS} 
 */
export HidP_GetUsageValueArray(ReportType, UsagePage, LinkCollection, Usage, UsageValue, UsageValueByteLength, PreparsedData, Report, ReportLength) {
    result := DllCall("HID.dll\HidP_GetUsageValueArray", HIDP_REPORT_TYPE, ReportType, "ushort", UsagePage, "ushort", LinkCollection, "ushort", Usage, "ptr", UsageValue, "ushort", UsageValueByteLength, PHIDP_PREPARSED_DATA, PreparsedData, "ptr", Report, "uint", ReportLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} PreviousUsageList 
 * @param {Pointer<Integer>} CurrentUsageList 
 * @param {Pointer<Integer>} BreakUsageList 
 * @param {Pointer<Integer>} MakeUsageList 
 * @param {Integer} UsageListLength 
 * @returns {NTSTATUS} 
 */
export HidP_UsageListDifference(PreviousUsageList, CurrentUsageList, BreakUsageList, MakeUsageList, UsageListLength) {
    PreviousUsageListMarshal := PreviousUsageList is VarRef ? "ushort*" : "ptr"
    CurrentUsageListMarshal := CurrentUsageList is VarRef ? "ushort*" : "ptr"
    BreakUsageListMarshal := BreakUsageList is VarRef ? "ushort*" : "ptr"
    MakeUsageListMarshal := MakeUsageList is VarRef ? "ushort*" : "ptr"

    result := DllCall("HID.dll\HidP_UsageListDifference", PreviousUsageListMarshal, PreviousUsageList, CurrentUsageListMarshal, CurrentUsageList, BreakUsageListMarshal, BreakUsageList, MakeUsageListMarshal, MakeUsageList, "uint", UsageListLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HIDP_REPORT_TYPE} ReportType 
 * @param {Integer} UsagePage 
 * @param {Integer} LinkCollection 
 * @param {Integer} Usage 
 * @param {Pointer<HIDP_BUTTON_ARRAY_DATA>} ButtonData 
 * @param {Pointer<Integer>} ButtonDataLength 
 * @param {PHIDP_PREPARSED_DATA} PreparsedData 
 * @param {Integer} Report 
 * @param {Integer} ReportLength 
 * @returns {NTSTATUS} 
 */
export HidP_GetButtonArray(ReportType, UsagePage, LinkCollection, Usage, ButtonData, ButtonDataLength, PreparsedData, Report, ReportLength) {
    ButtonDataLengthMarshal := ButtonDataLength is VarRef ? "ushort*" : "ptr"

    result := DllCall("HID.dll\HidP_GetButtonArray", HIDP_REPORT_TYPE, ReportType, "ushort", UsagePage, "ushort", LinkCollection, "ushort", Usage, HIDP_BUTTON_ARRAY_DATA.Ptr, ButtonData, ButtonDataLengthMarshal, ButtonDataLength, PHIDP_PREPARSED_DATA, PreparsedData, "ptr", Report, "uint", ReportLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HIDP_REPORT_TYPE} ReportType 
 * @param {Integer} UsagePage 
 * @param {Integer} LinkCollection 
 * @param {Integer} Usage 
 * @param {Pointer<HIDP_BUTTON_ARRAY_DATA>} ButtonData 
 * @param {Integer} ButtonDataLength 
 * @param {PHIDP_PREPARSED_DATA} PreparsedData 
 * @param {Integer} Report 
 * @param {Integer} ReportLength 
 * @returns {NTSTATUS} 
 */
export HidP_SetButtonArray(ReportType, UsagePage, LinkCollection, Usage, ButtonData, ButtonDataLength, PreparsedData, Report, ReportLength) {
    result := DllCall("HID.dll\HidP_SetButtonArray", HIDP_REPORT_TYPE, ReportType, "ushort", UsagePage, "ushort", LinkCollection, "ushort", Usage, HIDP_BUTTON_ARRAY_DATA.Ptr, ButtonData, "ushort", ButtonDataLength, PHIDP_PREPARSED_DATA, PreparsedData, "ptr", Report, "uint", ReportLength, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} ChangedUsageList 
 * @param {Integer} UsageListLength 
 * @param {HIDP_KEYBOARD_DIRECTION} KeyAction 
 * @param {Pointer<HIDP_KEYBOARD_MODIFIER_STATE>} ModifierState 
 * @param {Pointer<PHIDP_INSERT_SCANCODES>} InsertCodesProcedure 
 * @param {Pointer<Void>} InsertCodesContext 
 * @returns {NTSTATUS} 
 */
export HidP_TranslateUsagesToI8042ScanCodes(ChangedUsageList, UsageListLength, KeyAction, ModifierState, InsertCodesProcedure, InsertCodesContext) {
    ChangedUsageListMarshal := ChangedUsageList is VarRef ? "ushort*" : "ptr"
    InsertCodesContextMarshal := InsertCodesContext is VarRef ? "ptr" : "ptr"

    result := DllCall("HID.dll\HidP_TranslateUsagesToI8042ScanCodes", ChangedUsageListMarshal, ChangedUsageList, "uint", UsageListLength, HIDP_KEYBOARD_DIRECTION, KeyAction, HIDP_KEYBOARD_MODIFIER_STATE.Ptr, ModifierState, "ptr", InsertCodesProcedure, InsertCodesContextMarshal, InsertCodesContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} HidDeviceObject 
 * @param {Pointer<HIDD_ATTRIBUTES>} Attributes 
 * @returns {BOOLEAN} 
 */
export HidD_GetAttributes(HidDeviceObject, Attributes) {
    result := DllCall("HID.dll\HidD_GetAttributes", HANDLE, HidDeviceObject, HIDD_ATTRIBUTES.Ptr, Attributes, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<Guid>} HidGuid 
 * @returns {String} Nothing - always returns an empty string
 */
export HidD_GetHidGuid(HidGuid) {
    DllCall("HID.dll\HidD_GetHidGuid", Guid.Ptr, HidGuid)
}

/**
 * 
 * @param {HANDLE} HidDeviceObject 
 * @param {Pointer<PHIDP_PREPARSED_DATA>} PreparsedData 
 * @returns {BOOLEAN} 
 */
export HidD_GetPreparsedData(HidDeviceObject, PreparsedData) {
    PreparsedDataMarshal := PreparsedData is VarRef ? "ptr*" : "ptr"

    result := DllCall("HID.dll\HidD_GetPreparsedData", HANDLE, HidDeviceObject, PreparsedDataMarshal, PreparsedData, BOOLEAN)
    return result
}

/**
 * 
 * @param {PHIDP_PREPARSED_DATA} PreparsedData 
 * @returns {BOOLEAN} 
 */
export HidD_FreePreparsedData(PreparsedData) {
    result := DllCall("HID.dll\HidD_FreePreparsedData", PHIDP_PREPARSED_DATA, PreparsedData, BOOLEAN)
    return result
}

/**
 * 
 * @param {HANDLE} HidDeviceObject 
 * @returns {BOOLEAN} 
 */
export HidD_FlushQueue(HidDeviceObject) {
    result := DllCall("HID.dll\HidD_FlushQueue", HANDLE, HidDeviceObject, BOOLEAN)
    return result
}

/**
 * 
 * @param {HANDLE} HidDeviceObject 
 * @param {Integer} Configuration 
 * @param {Integer} ConfigurationLength 
 * @returns {BOOLEAN} 
 */
export HidD_GetConfiguration(HidDeviceObject, Configuration, ConfigurationLength) {
    result := DllCall("HID.dll\HidD_GetConfiguration", HANDLE, HidDeviceObject, "ptr", Configuration, "uint", ConfigurationLength, BOOLEAN)
    return result
}

/**
 * 
 * @param {HANDLE} HidDeviceObject 
 * @param {Integer} Configuration 
 * @param {Integer} ConfigurationLength 
 * @returns {BOOLEAN} 
 */
export HidD_SetConfiguration(HidDeviceObject, Configuration, ConfigurationLength) {
    result := DllCall("HID.dll\HidD_SetConfiguration", HANDLE, HidDeviceObject, "ptr", Configuration, "uint", ConfigurationLength, BOOLEAN)
    return result
}

/**
 * 
 * @param {HANDLE} HidDeviceObject 
 * @param {Integer} ReportBuffer 
 * @param {Integer} ReportBufferLength 
 * @returns {BOOLEAN} 
 */
export HidD_GetFeature(HidDeviceObject, ReportBuffer, ReportBufferLength) {
    result := DllCall("HID.dll\HidD_GetFeature", HANDLE, HidDeviceObject, "ptr", ReportBuffer, "uint", ReportBufferLength, BOOLEAN)
    return result
}

/**
 * 
 * @param {HANDLE} HidDeviceObject 
 * @param {Integer} ReportBuffer 
 * @param {Integer} ReportBufferLength 
 * @returns {BOOLEAN} 
 */
export HidD_SetFeature(HidDeviceObject, ReportBuffer, ReportBufferLength) {
    result := DllCall("HID.dll\HidD_SetFeature", HANDLE, HidDeviceObject, "ptr", ReportBuffer, "uint", ReportBufferLength, BOOLEAN)
    return result
}

/**
 * 
 * @param {HANDLE} HidDeviceObject 
 * @param {Integer} ReportBuffer 
 * @param {Integer} ReportBufferLength 
 * @returns {BOOLEAN} 
 */
export HidD_GetInputReport(HidDeviceObject, ReportBuffer, ReportBufferLength) {
    result := DllCall("HID.dll\HidD_GetInputReport", HANDLE, HidDeviceObject, "ptr", ReportBuffer, "uint", ReportBufferLength, BOOLEAN)
    return result
}

/**
 * 
 * @param {HANDLE} HidDeviceObject 
 * @param {Integer} ReportBuffer 
 * @param {Integer} ReportBufferLength 
 * @returns {BOOLEAN} 
 */
export HidD_SetOutputReport(HidDeviceObject, ReportBuffer, ReportBufferLength) {
    result := DllCall("HID.dll\HidD_SetOutputReport", HANDLE, HidDeviceObject, "ptr", ReportBuffer, "uint", ReportBufferLength, BOOLEAN)
    return result
}

/**
 * 
 * @param {HANDLE} HidDeviceObject 
 * @param {Pointer<Integer>} NumberBuffers 
 * @returns {BOOLEAN} 
 */
export HidD_GetNumInputBuffers(HidDeviceObject, NumberBuffers) {
    NumberBuffersMarshal := NumberBuffers is VarRef ? "uint*" : "ptr"

    result := DllCall("HID.dll\HidD_GetNumInputBuffers", HANDLE, HidDeviceObject, NumberBuffersMarshal, NumberBuffers, BOOLEAN)
    return result
}

/**
 * 
 * @param {HANDLE} HidDeviceObject 
 * @param {Integer} NumberBuffers 
 * @returns {BOOLEAN} 
 */
export HidD_SetNumInputBuffers(HidDeviceObject, NumberBuffers) {
    result := DllCall("HID.dll\HidD_SetNumInputBuffers", HANDLE, HidDeviceObject, "uint", NumberBuffers, BOOLEAN)
    return result
}

/**
 * 
 * @param {HANDLE} HidDeviceObject 
 * @param {Integer} _Buffer 
 * @param {Integer} BufferLength 
 * @returns {BOOLEAN} 
 */
export HidD_GetPhysicalDescriptor(HidDeviceObject, _Buffer, BufferLength) {
    result := DllCall("HID.dll\HidD_GetPhysicalDescriptor", HANDLE, HidDeviceObject, "ptr", _Buffer, "uint", BufferLength, BOOLEAN)
    return result
}

/**
 * 
 * @param {HANDLE} HidDeviceObject 
 * @param {Integer} _Buffer 
 * @param {Integer} BufferLength 
 * @returns {BOOLEAN} 
 */
export HidD_GetManufacturerString(HidDeviceObject, _Buffer, BufferLength) {
    result := DllCall("HID.dll\HidD_GetManufacturerString", HANDLE, HidDeviceObject, "ptr", _Buffer, "uint", BufferLength, BOOLEAN)
    return result
}

/**
 * 
 * @param {HANDLE} HidDeviceObject 
 * @param {Integer} _Buffer 
 * @param {Integer} BufferLength 
 * @returns {BOOLEAN} 
 */
export HidD_GetProductString(HidDeviceObject, _Buffer, BufferLength) {
    result := DllCall("HID.dll\HidD_GetProductString", HANDLE, HidDeviceObject, "ptr", _Buffer, "uint", BufferLength, BOOLEAN)
    return result
}

/**
 * 
 * @param {HANDLE} HidDeviceObject 
 * @param {Integer} StringIndex 
 * @param {Integer} _Buffer 
 * @param {Integer} BufferLength 
 * @returns {BOOLEAN} 
 */
export HidD_GetIndexedString(HidDeviceObject, StringIndex, _Buffer, BufferLength) {
    result := DllCall("HID.dll\HidD_GetIndexedString", HANDLE, HidDeviceObject, "uint", StringIndex, "ptr", _Buffer, "uint", BufferLength, BOOLEAN)
    return result
}

/**
 * 
 * @param {HANDLE} HidDeviceObject 
 * @param {Integer} _Buffer 
 * @param {Integer} BufferLength 
 * @returns {BOOLEAN} 
 */
export HidD_GetSerialNumberString(HidDeviceObject, _Buffer, BufferLength) {
    result := DllCall("HID.dll\HidD_GetSerialNumberString", HANDLE, HidDeviceObject, "ptr", _Buffer, "uint", BufferLength, BOOLEAN)
    return result
}

/**
 * 
 * @param {HANDLE} HidDeviceObject 
 * @param {Integer} _Buffer 
 * @param {Integer} BufferLength 
 * @returns {BOOLEAN} 
 */
export HidD_GetMsGenreDescriptor(HidDeviceObject, _Buffer, BufferLength) {
    result := DllCall("HID.dll\HidD_GetMsGenreDescriptor", HANDLE, HidDeviceObject, "ptr", _Buffer, "uint", BufferLength, BOOLEAN)
    return result
}

;@endregion Functions
