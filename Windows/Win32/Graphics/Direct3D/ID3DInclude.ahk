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

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 0

    /**
     * 
     * @param {Integer} IncludeType 
     * @param {PSTR} pFileName 
     * @param {Pointer<Void>} pParentData 
     * @param {Pointer<Void>} ppData 
     * @param {Pointer<UInt32>} pBytes 
     * @returns {HRESULT} 
     */
    Open(IncludeType, pFileName, pParentData, ppData, pBytes) {
        result := ComCall(0, this, "int", IncludeType, "ptr", pFileName, "ptr", pParentData, "ptr", ppData, "uint*", pBytes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pData 
     * @returns {HRESULT} 
     */
    Close(pData) {
        result := ComCall(1, this, "ptr", pData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
