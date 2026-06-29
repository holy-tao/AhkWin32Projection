#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\AAAccountingData.ahk" { AAAccountingData }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\AAAccountingDataType.ahk" { AAAccountingDataType }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that provide information about the creation or closing of sessions for a connection.
 * @remarks
 * Your authorization plug-in can use this interface to retrieve useful information about clients, client  computers, and remote sessions. For example, your plug-in can track the amount of time that a client is connected and the amount of data transferred during that session.
 * 
 * For a sample that uses the <b>ITSGAccountingEngine</b> interface, see the [Remote Desktop Gateway Pluggable Authentication and Authorization](https://github.com/microsoftarchive/msdn-code-gallery-community-m-r/tree/master/Remote%20Desktop%20Gateway%20Pluggable%20Authentication%20and%20Authorization%20Sample) sample.
 * @see https://learn.microsoft.com/windows/win32/api/tsgpolicyengine/nn-tsgpolicyengine-itsgaccountingengine
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct ITSGAccountingEngine extends IUnknown {
    /**
     * The interface identifier for ITSGAccountingEngine
     * @type {Guid}
     */
    static IID := Guid("{4ce2a0c9-e874-4f1a-86f4-06bbb9115338}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITSGAccountingEngine interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        DoAccounting : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITSGAccountingEngine.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Provides information about the creation or closing of sessions for a connection.
     * @param {AAAccountingDataType} accountingDataType A value of the <a href="https://docs.microsoft.com/windows/win32/api/tsgpolicyengine/ns-tsgpolicyengine-aaaccountingdata">AAAccountingDataType</a> 
     *       enumeration type that specifies the type of event that occurred.
     * @param {AAAccountingData} accountingData An <a href="https://docs.microsoft.com/windows/win32/api/tsgpolicyengine/ns-tsgpolicyengine-aaaccountingdata">AAAccountingData</a> structure that contains 
     *        information about the event that occurred.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tsgpolicyengine/nf-tsgpolicyengine-itsgaccountingengine-doaccounting
     */
    DoAccounting(accountingDataType, accountingData) {
        result := ComCall(3, this, AAAccountingDataType, accountingDataType, AAAccountingData, accountingData, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITSGAccountingEngine.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DoAccounting := CallbackCreate(GetMethod(implObj, "DoAccounting"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DoAccounting)
    }
}
