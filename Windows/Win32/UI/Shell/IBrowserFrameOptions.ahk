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
     * 
     * @param {Integer} dwMask 
     * @param {Pointer<UInt32>} pdwOptions 
     * @returns {HRESULT} 
     */
    GetFrameOptions(dwMask, pdwOptions) {
        result := ComCall(3, this, "uint", dwMask, "uint*", pdwOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
