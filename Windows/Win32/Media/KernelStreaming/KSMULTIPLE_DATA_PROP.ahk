#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSMULTIPLE_ITEM.ahk" { KSMULTIPLE_ITEM }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSMULTIPLE_DATA_PROP {
    #StructPack 8

    Property : KSIDENTIFIER

    MultipleItem : KSMULTIPLE_ITEM

}
