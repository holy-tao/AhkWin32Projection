#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMSVidFeature.ahk" { IMSVidFeature }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Note  This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 or later. The IMSVidXDS interface provides access to the extended data services. The MSVidXDS feature exposes this interface.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidXDS)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidxds
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidXDS extends IMSVidFeature {
    /**
     * The interface identifier for IMSVidXDS
     * @type {Guid}
     */
    static IID := Guid("{11ebc158-e712-4d1f-8bb3-01ed5274c4ce}")

    /**
     * The class identifier for MSVidXDS
     * @type {Guid}
     */
    static CLSID := Guid("{0149eedf-d08f-4142-8d73-d23903d21e90}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidXDS interfaces
    */
    struct Vtbl extends IMSVidFeature.Vtbl {
        get_ChannelChangeInterface : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidXDS.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IUnknown} 
     */
    ChannelChangeInterface {
        get => this.get_ChannelChangeInterface()
    }

    /**
     * Note  This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 or later. .
     * @returns {IUnknown} Receives a pointer to the <b>IUnknown</b> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidxds-get_channelchangeinterface
     */
    get_ChannelChangeInterface() {
        result := ComCall(16, this, "ptr*", &punkCC := 0, "HRESULT")
        return IUnknown(punkCC)
    }

    Query(iid) {
        if (IMSVidXDS.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ChannelChangeInterface := CallbackCreate(GetMethod(implObj, "get_ChannelChangeInterface"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ChannelChangeInterface)
    }
}
