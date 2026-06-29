#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDvbLogicalChannelDescriptor2.ahk" { IDvbLogicalChannelDescriptor2 }

/**
 * Implements the IDvbLogicalChannelDescriptor interface for Digital Video Broadcast (DVB) streams based on Motion Picture Experts Group Version 4 Advanced Video Coding (MPEG-4AVC) that support high-definition (HD) simulcasting.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-idvbhdsimulcastlogicalchanneldescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IDvbHDSimulcastLogicalChannelDescriptor extends IDvbLogicalChannelDescriptor2 {
    /**
     * The interface identifier for IDvbHDSimulcastLogicalChannelDescriptor
     * @type {Guid}
     */
    static IID := Guid("{1ea8b738-a307-4680-9e26-d0a908c824f4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDvbHDSimulcastLogicalChannelDescriptor interfaces
    */
    struct Vtbl extends IDvbLogicalChannelDescriptor2.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDvbHDSimulcastLogicalChannelDescriptor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IDvbHDSimulcastLogicalChannelDescriptor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
    }
}
