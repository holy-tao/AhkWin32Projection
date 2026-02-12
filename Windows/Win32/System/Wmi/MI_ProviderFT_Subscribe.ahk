#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_ProviderFT_Subscribe extends IUnknown {

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
     * @param {Pointer<Void>} self 
     * @param {Pointer<MI_Context>} context_ 
     * @param {Pointer<Integer>} nameSpace 
     * @param {Pointer<Integer>} className 
     * @param {Pointer<MI_Filter>} filter 
     * @param {Pointer<Integer>} bookmark 
     * @param {Integer} subscriptionID 
     * @param {Pointer<Pointer<Void>>} subscriptionSelf 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(self, context_, nameSpace, className, filter, bookmark, subscriptionID, subscriptionSelf) {
        selfMarshal := self is VarRef ? "ptr" : "ptr"
        nameSpaceMarshal := nameSpace is VarRef ? "ushort*" : "ptr"
        classNameMarshal := className is VarRef ? "ushort*" : "ptr"
        bookmarkMarshal := bookmark is VarRef ? "ushort*" : "ptr"
        subscriptionSelfMarshal := subscriptionSelf is VarRef ? "ptr*" : "ptr"

        ComCall(3, this, selfMarshal, self, "ptr", context_, nameSpaceMarshal, nameSpace, classNameMarshal, className, "ptr", filter, bookmarkMarshal, bookmark, "uint", subscriptionID, subscriptionSelfMarshal, subscriptionSelf)
    }
}
