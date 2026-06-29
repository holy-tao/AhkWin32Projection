#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWMDMProgress.ahk" { IWMDMProgress }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The optional, application-implemented IWMDMProgress2 interface extends the IWMDMProgress::End method by providing a status indicator.
 * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nn-mswmdm-iwmdmprogress2
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct IWMDMProgress2 extends IWMDMProgress {
    /**
     * The interface identifier for IWMDMProgress2
     * @type {Guid}
     */
    static IID := Guid("{3a43f550-b383-4e92-b04a-e6bbc660fefc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMDMProgress2 interfaces
    */
    struct Vtbl extends IWMDMProgress.Vtbl {
        End2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMDMProgress2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The End2 method extends IWMDMProgress::End by providing a completion status indicator.
     * @remarks
     * <b>IWMDMProgress2</b> is a callback interface provided by the application to Windows Media Device Manager for a particular operation. <b>End2</b> is called when that operation is completed. The <i>hrCompletionCode</i> parameter is the completion status of the operation that was in progress. For example, an application can provide an <b>IWMDMProgress2</b> interface pointer to the <b>Insert2</b> method. When the file transfer done by <b>Insert2</b> is completed, <b>End2</b> is called on the <b>IWMDMProgress2</b> interface pointer with the completion status of the file transfer as the <i>hrCompletion</i> parameter.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmprogress3-end3">IWMDMProgress3::End3</a> provides more information, and should be implemented instead of this method.
     * @param {HRESULT} hrCompletionCode The return value of the operation that ended.
     * @returns {HRESULT} The return value from the method is ignored by Windows Media Device Manager.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmprogress2-end2
     */
    End2(hrCompletionCode) {
        result := ComCall(6, this, "int", hrCompletionCode, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMDMProgress2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.End2 := CallbackCreate(GetMethod(implObj, "End2"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.End2)
    }
}
