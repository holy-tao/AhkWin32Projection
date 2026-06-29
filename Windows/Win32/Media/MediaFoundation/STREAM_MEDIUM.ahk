#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Not for application use.
 * @remarks
 * This structure is used internally by the Microsoft Media Foundation AVStream proxy.
 * @see https://learn.microsoft.com/windows/win32/api/mftransform/ns-mftransform-stream_medium
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct STREAM_MEDIUM {
    #StructPack 4

    /**
     * Reserved.
     */
    gidMedium : Guid

    /**
     * Reserved.
     */
    unMediumInstance : UInt32

}
