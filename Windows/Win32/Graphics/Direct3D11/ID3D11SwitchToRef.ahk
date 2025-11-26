#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * ID3D11SwitchToRef interface
 * @see https://docs.microsoft.com/windows/win32/api//d3d11sdklayers/nn-d3d11sdklayers-id3d11switchtoref
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11SwitchToRef extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11SwitchToRef
     * @type {Guid}
     */
    static IID => Guid("{1ef337e3-58e7-4f83-a692-db221f5ed47e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetUseRef", "GetUseRef"]

    /**
     * ID3D11SwitchToRef::SetUseRef method
     * @param {BOOL} UseRef Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Reserved.
     * @returns {BOOL} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Reserved.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11sdklayers/nf-d3d11sdklayers-id3d11switchtoref-setuseref
     */
    SetUseRef(UseRef) {
        result := ComCall(3, this, "int", UseRef, "int")
        return result
    }

    /**
     * ID3D11SwitchToRef::GetUseRef method
     * @returns {BOOL} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Reserved.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11sdklayers/nf-d3d11sdklayers-id3d11switchtoref-getuseref
     */
    GetUseRef() {
        result := ComCall(4, this, "int")
        return result
    }
}
