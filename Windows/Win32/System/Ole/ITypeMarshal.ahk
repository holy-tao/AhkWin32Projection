#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class ITypeMarshal extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITypeMarshal
     * @type {Guid}
     */
    static IID => Guid("{0000002d-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Size", "Marshal", "Unmarshal", "Free"]

    /**
     * The Size class encapsulates a Width and Height dimension in a 2-D coordinate system.
     * @param {Pointer<Void>} pvType 
     * @param {Integer} dwDestContext 
     * @param {Pointer<Void>} pvDestContext 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//gdiplustypes/nl-gdiplustypes-size
     */
    Size(pvType, dwDestContext, pvDestContext) {
        pvTypeMarshal := pvType is VarRef ? "ptr" : "ptr"
        pvDestContextMarshal := pvDestContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, pvTypeMarshal, pvType, "uint", dwDestContext, pvDestContextMarshal, pvDestContext, "uint*", &pSize := 0, "HRESULT")
        return pSize
    }

    /**
     * 
     * @param {Pointer<Void>} pvType 
     * @param {Integer} dwDestContext 
     * @param {Pointer<Void>} pvDestContext 
     * @param {Integer} cbBufferLength 
     * @param {Pointer} pBuffer 
     * @returns {Integer} 
     */
    Marshal(pvType, dwDestContext, pvDestContext, cbBufferLength, pBuffer) {
        pvTypeMarshal := pvType is VarRef ? "ptr" : "ptr"
        pvDestContextMarshal := pvDestContext is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, pvTypeMarshal, pvType, "uint", dwDestContext, pvDestContextMarshal, pvDestContext, "uint", cbBufferLength, "ptr", pBuffer, "uint*", &pcbWritten := 0, "HRESULT")
        return pcbWritten
    }

    /**
     * 
     * @param {Pointer<Void>} pvType 
     * @param {Integer} dwFlags 
     * @param {Integer} cbBufferLength 
     * @param {Pointer<Integer>} pBuffer 
     * @param {Pointer<Integer>} pcbRead 
     * @returns {HRESULT} 
     */
    Unmarshal(pvType, dwFlags, cbBufferLength, pBuffer, pcbRead) {
        pvTypeMarshal := pvType is VarRef ? "ptr" : "ptr"
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"
        pcbReadMarshal := pcbRead is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pvTypeMarshal, pvType, "uint", dwFlags, "uint", cbBufferLength, pBufferMarshal, pBuffer, pcbReadMarshal, pcbRead, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvType 
     * @returns {HRESULT} 
     */
    Free(pvType) {
        pvTypeMarshal := pvType is VarRef ? "ptr" : "ptr"

        result := ComCall(6, this, pvTypeMarshal, pvType, "HRESULT")
        return result
    }
}
