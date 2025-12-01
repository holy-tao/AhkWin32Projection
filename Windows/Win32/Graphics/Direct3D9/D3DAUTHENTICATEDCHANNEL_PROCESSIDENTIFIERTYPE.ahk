#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of process that is identified in the D3DAUTHENTICATEDCHANNEL\_QUERYRESTRICTEDSHAREDRESOURCEPROCESS\_OUTPUT structure.
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dauthenticatedchannel-processidentifiertype
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DAUTHENTICATEDCHANNEL_PROCESSIDENTIFIERTYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PROCESSIDTYPE_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static PROCESSIDTYPE_DWM => 1

    /**
     * @type {Integer (Int32)}
     */
    static PROCESSIDTYPE_HANDLE => 2
}
