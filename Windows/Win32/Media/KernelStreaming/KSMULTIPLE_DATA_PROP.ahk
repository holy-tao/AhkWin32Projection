#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\KSMULTIPLE_ITEM.ahk" { KSMULTIPLE_ITEM }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSMULTIPLE_DATA_PROP {
    #StructPack 8

    Property : KSIDENTIFIER

    MultipleItem : KSMULTIPLE_ITEM

}
