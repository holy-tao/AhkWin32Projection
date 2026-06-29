#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EVENT_FIELD_TYPE.ahk" { EVENT_FIELD_TYPE }
#Import ".\PROVIDER_FIELD_INFO.ahk" { PROVIDER_FIELD_INFO }

/**
 * Defines metadata information about the requested field.
 * @see https://learn.microsoft.com/windows/win32/api/tdh/ns-tdh-provider_field_infoarray
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct PROVIDER_FIELD_INFOARRAY {
    #StructPack 8

    /**
     * Number of elements in the <b>FieldInfoArray</b> array.
     */
    NumberOfElements : UInt32

    /**
     * Type of field information in  the <b>FieldInfoArray</b> array. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ne-tdh-event_field_type">EVENT_FIELD_TYPE</a> enumeration.
     */
    FieldType : EVENT_FIELD_TYPE

    /**
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-provider_field_info">PROVIDER_FIELD_INFO</a> structures that define the field's name, description and value.
     */
    FieldInfoArray : PROVIDER_FIELD_INFO[1]

}
