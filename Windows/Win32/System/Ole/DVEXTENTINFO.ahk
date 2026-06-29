#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\SIZE.ahk" { SIZE }

/**
 * Represents the sizing data used in IViewObjectEx::GetNaturalExtent.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/ns-ocidl-dvextentinfo
 * @namespace Windows.Win32.System.Ole
 */
export default struct DVEXTENTINFO {
    #StructPack 4

    /**
     * The size of the structure, in bytes.
     */
    cb : UInt32

    /**
     * Indicates whether the sizing mode is content or integral sizing. See the <a href="https://docs.microsoft.com/windows/win32/api/ocidl/ne-ocidl-dvextentmode">DVEXTENTMODE</a> enumeration for possible values.
     */
    dwExtentMode : UInt32

    /**
     * The proposed size in content sizing or the preferred size in integral sizing.
     */
    sizelProposed : SIZE

}
