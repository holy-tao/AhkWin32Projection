#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Allows a browser or host to ask IShellView what kind of view behavior is supported.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ibrowserframeoptions
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IBrowserFrameOptions extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBrowserFrameOptions
     * @type {Guid}
     */
    static IID => Guid("{10df43c8-1dbe-11d3-8b34-006097df5bd4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFrameOptions"]

    /**
     * Retrieves the available browser frame view options.
     * @param {Integer} dwMask Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_browserframeoptions">BROWSERFRAMEOPTIONS</a></b>
     * 
     * Specifies the options requested as a bitwise combination of one or more of the constants of enumeration type <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_browserframeoptions">BROWSERFRAMEOPTIONS</a>.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_browserframeoptions">BROWSERFRAMEOPTIONS</a>*</b>
     * 
     * When this method returns, contains the options that the view  can enable (for example, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> ). This value is not optional and is always equal to, or a subset of, the options specified by <i>dwMask</i>.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ibrowserframeoptions-getframeoptions
     */
    GetFrameOptions(dwMask) {
        result := ComCall(3, this, "uint", dwMask, "uint*", &pdwOptions := 0, "HRESULT")
        return pdwOptions
    }
}
