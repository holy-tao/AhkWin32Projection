#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Used to provide requested class object during deserialization.
 * @see https://learn.microsoft.com/windows/win32/api//content/mi/nc-mi-mi_deserializer_classobjectneeded
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_Deserializer_ClassObjectNeeded extends IUnknown {

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
     * @param {Pointer<Void>} context_ 
     * @param {Pointer<Integer>} serverName 
     * @param {Pointer<Integer>} namespaceName 
     * @param {Pointer<Integer>} className 
     * @param {Pointer<Pointer<MI_Class>>} requestedClassObject 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(context_, serverName, namespaceName, className, requestedClassObject) {
        context_Marshal := context_ is VarRef ? "ptr" : "ptr"
        serverNameMarshal := serverName is VarRef ? "ushort*" : "ptr"
        namespaceNameMarshal := namespaceName is VarRef ? "ushort*" : "ptr"
        classNameMarshal := className is VarRef ? "ushort*" : "ptr"
        requestedClassObjectMarshal := requestedClassObject is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, context_Marshal, context_, serverNameMarshal, serverName, namespaceNameMarshal, namespaceName, classNameMarshal, className, requestedClassObjectMarshal, requestedClassObject, "int")
        return result
    }
}
