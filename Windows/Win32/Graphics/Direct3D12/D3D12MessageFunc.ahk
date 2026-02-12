#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12MessageFunc extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Integer} Category 
     * @param {Integer} Severity 
     * @param {Integer} ID 
     * @param {PSTR} pDescription 
     * @param {Pointer<Void>} pContext 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Category, Severity, ID, pDescription, pContext) {
        pDescription := pDescription is String ? StrPtr(pDescription) : pDescription

        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "int", Category, "int", Severity, "int", ID, "ptr", pDescription, pContextMarshal, pContext)
    }
}
