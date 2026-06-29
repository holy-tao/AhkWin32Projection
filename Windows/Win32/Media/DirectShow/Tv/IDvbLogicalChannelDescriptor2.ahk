#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDvbLogicalChannelDescriptor.ahk" { IDvbLogicalChannelDescriptor }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IDvbLogicalChannelDescriptor2 interface enables the client to get a logical channel descriptor from a DVB stream. The logical channel descriptor may be present in the network information table (NIT).
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-idvblogicalchanneldescriptor2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IDvbLogicalChannelDescriptor2 extends IDvbLogicalChannelDescriptor {
    /**
     * The interface identifier for IDvbLogicalChannelDescriptor2
     * @type {Guid}
     */
    static IID := Guid("{43aca974-4be8-4b98-bc17-9eafd788b1d7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDvbLogicalChannelDescriptor2 interfaces
    */
    struct Vtbl extends IDvbLogicalChannelDescriptor.Vtbl {
        GetRecordLogicalChannelAndVisibility : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDvbLogicalChannelDescriptor2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @returns {Integer} 
     */
    GetRecordLogicalChannelAndVisibility(bRecordIndex) {
        result := ComCall(8, this, "char", bRecordIndex, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    Query(iid) {
        if (IDvbLogicalChannelDescriptor2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRecordLogicalChannelAndVisibility := CallbackCreate(GetMethod(implObj, "GetRecordLogicalChannelAndVisibility"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRecordLogicalChannelAndVisibility)
    }
}
