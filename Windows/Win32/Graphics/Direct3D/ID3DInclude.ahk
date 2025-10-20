#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * ID3DInclude is an include interface that the user implements to allow an application to call user-overridable methods for opening and closing shader
 * @remarks
 * 
  * To use this interface, create an interface that inherits from <b>ID3DInclude</b> and implement custom behavior for the methods.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3dcommon/nn-d3dcommon-id3dinclude
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class ID3DInclude extends Win32ComInterface{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 0

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open", "Close"]

    /**
     * 
     * @param {Integer} IncludeType 
     * @param {PSTR} pFileName 
     * @param {Pointer<Void>} pParentData 
     * @param {Pointer<Pointer<Void>>} ppData 
     * @param {Pointer<Integer>} pBytes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3dcommon/nf-d3dcommon-id3dinclude-open
     */
    Open(IncludeType, pFileName, pParentData, ppData, pBytes) {
        result := ComCall(0, this, "int", IncludeType, "ptr", pFileName, "ptr", pParentData, "ptr*", ppData, "uint*", pBytes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3dcommon/nf-d3dcommon-id3dinclude-close
     */
    Close(pData) {
        result := ComCall(1, this, "ptr", pData, "HRESULT")
        return result
    }
}
