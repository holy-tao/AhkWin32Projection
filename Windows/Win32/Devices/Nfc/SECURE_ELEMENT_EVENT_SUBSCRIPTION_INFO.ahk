#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SECURE_ELEMENT_EVENT_TYPE.ahk" { SECURE_ELEMENT_EVENT_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct SECURE_ELEMENT_EVENT_SUBSCRIPTION_INFO {
    #StructPack 4

    guidSecureElementId : Guid

    eEventType : SECURE_ELEMENT_EVENT_TYPE

}
