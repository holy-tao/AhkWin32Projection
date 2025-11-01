#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IEnumWbemClassObject interface is used to enumerate Common Information Model (CIM) objects and is similar to a standard COM enumerator.
 * @remarks
 * 
  * <b>IEnumWbemClassObject</b> is the object returned from a WMI query, and is used to enumerate through the returned values. For more information on how to use this class, see <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/querying-wmi">Querying WMI</a> and <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/enumerating-wmi">Enumerating WMI</a>.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nn-wbemcli-ienumwbemclassobject
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IEnumWbemClassObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumWbemClassObject
     * @type {Guid}
     */
    static IID => Guid("{027947e1-d731-11ce-a357-000000000001}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Reset", "Next", "NextAsync", "Clone", "Skip"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-ienumwbemclassobject-reset
     */
    Reset() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lTimeout 
     * @param {Integer} uCount 
     * @param {Pointer<IWbemClassObject>} apObjects 
     * @param {Pointer<Integer>} puReturned 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-ienumwbemclassobject-next
     */
    Next(lTimeout, uCount, apObjects, puReturned) {
        puReturnedMarshal := puReturned is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "int", lTimeout, "uint", uCount, "ptr*", apObjects, puReturnedMarshal, puReturned, "int")
        return result
    }

    /**
     * 
     * @param {Integer} uCount 
     * @param {IWbemObjectSink} pSink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-ienumwbemclassobject-nextasync
     */
    NextAsync(uCount, pSink) {
        result := ComCall(5, this, "uint", uCount, "ptr", pSink, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumWbemClassObject>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-ienumwbemclassobject-clone
     */
    Clone(ppEnum) {
        result := ComCall(6, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lTimeout 
     * @param {Integer} nCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-ienumwbemclassobject-skip
     */
    Skip(lTimeout, nCount) {
        result := ComCall(7, this, "int", lTimeout, "uint", nCount, "int")
        return result
    }
}
