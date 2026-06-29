#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Provides information about the stylus.
 * @see https://learn.microsoft.com/windows/win32/api/rtscom/ns-rtscom-stylusinfo
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct StylusInfo {
    #StructPack 4

    /**
     * Uniquely identifies the tablet.
     */
    tcid : UInt32

    /**
     * Uniquely identifies the stylus.
     */
    cid : UInt32

    /**
     * <b>TRUE</b> if the stylus is upside down, otherwise <b>FALSE</b>.
     */
    bIsInvertedCursor : BOOL

}
