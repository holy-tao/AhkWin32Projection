#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\EnTvRat_GenericLevel.ahk" { EnTvRat_GenericLevel }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\BfEnTvRat_GenericAttributes.ahk" { BfEnTvRat_GenericAttributes }
#Import ".\EnTvRat_System.ahk" { EnTvRat_System }
#Import ".\IMSVidFeatureEvent.ahk" { IMSVidFeatureEvent }

/**
 * Note  This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 or later. The IMSVidXDSEvent interface is used to receive events from the MSVidXDS object.This interface is an outgoing connection-point interface.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidXDSEvent)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidxdsevent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidXDSEvent extends IMSVidFeatureEvent {
    /**
     * The interface identifier for IMSVidXDSEvent
     * @type {Guid}
     */
    static IID := Guid("{6db2317d-3b23-41ec-ba4b-701f407eaf3a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidXDSEvent interfaces
    */
    struct Vtbl extends IMSVidFeatureEvent.Vtbl {
        RatingChange : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidXDSEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The RatingChange method is called when the current rating changes.
     * @param {EnTvRat_System} PrevRatingSystem The previous rating system, as an <a href="https://docs.microsoft.com/previous-versions/dd375612(v=vs.85)">EnTvRat_System</a> enumeration type.
     * @param {EnTvRat_GenericLevel} PrevLevel The previous rating level, as an <a href="https://docs.microsoft.com/previous-versions/dd375610(v=vs.85)">EnTvRat_GenericLevel</a> enumeration type. The meaning of this value depends on the rating system.
     * @param {BfEnTvRat_GenericAttributes} PrevAttributes The previous rating attributes. This value is a bitwise OR of flags from the <a href="https://docs.microsoft.com/previous-versions/dd318226(v=vs.85)">BfEnTvRat_GenericAttributes</a> enumeration. These flags specify content attributes, such as violence or adult language. Content attributes do not apply to all rating systems.
     * @param {EnTvRat_System} NewRatingSystem The new rating system, as an <b>EnTvRat_System</b> enumeration type.
     * @param {EnTvRat_GenericLevel} NewLevel The new rating level, as an <b>EnTvRat_GenericLevel</b> enumeration type.
     * @param {BfEnTvRat_GenericAttributes} NewAttributes Specifies the new rating attributes. This value is a bitwise OR of flags from the <b>BfEnTvRat_GenericAttributes</b> enumeration.
     * @returns {HRESULT} Return S_OK or an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidxdsevent-ratingchange
     */
    RatingChange(PrevRatingSystem, PrevLevel, PrevAttributes, NewRatingSystem, NewLevel, NewAttributes) {
        result := ComCall(8, this, EnTvRat_System, PrevRatingSystem, EnTvRat_GenericLevel, PrevLevel, BfEnTvRat_GenericAttributes, PrevAttributes, EnTvRat_System, NewRatingSystem, EnTvRat_GenericLevel, NewLevel, BfEnTvRat_GenericAttributes, NewAttributes, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMSVidXDSEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RatingChange := CallbackCreate(GetMethod(implObj, "RatingChange"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RatingChange)
    }
}
