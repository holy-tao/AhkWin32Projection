#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\EnTvRat_GenericLevel.ahk" { EnTvRat_GenericLevel }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\EnTvRat_System.ahk" { EnTvRat_System }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IMSVidFilePlayback.ahk" { IMSVidFilePlayback }

/**
 * The IMSVidStreamBufferSource interface represents the Stream Buffer Source filter within the Video Control.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidStreamBufferSource)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidstreambuffersource
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidStreamBufferSource extends IMSVidFilePlayback {
    /**
     * The interface identifier for IMSVidStreamBufferSource
     * @type {Guid}
     */
    static IID := Guid("{eb0c8cf9-6950-4772-87b1-47d11cf3a02f}")

    /**
     * The class identifier for MSVidStreamBufferSource
     * @type {Guid}
     */
    static CLSID := Guid("{ad8e510d-217f-409b-8076-29c5e73b98e8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidStreamBufferSource interfaces
    */
    struct Vtbl extends IMSVidFilePlayback.Vtbl {
        get_Start              : IntPtr
        get_RecordingAttribute : IntPtr
        CurrentRatings         : IntPtr
        MaxRatingsLevel        : IntPtr
        put_BlockUnrated       : IntPtr
        put_UnratedDelay       : IntPtr
        get_SBESource          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidStreamBufferSource.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Start {
        get => this.get_Start()
    }

    /**
     * @type {IUnknown} 
     */
    RecordingAttribute {
        get => this.get_RecordingAttribute()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    BlockUnrated {
        set => this.put_BlockUnrated(value)
    }

    /**
     * @type {Integer} 
     */
    UnratedDelay {
        set => this.put_UnratedDelay(value)
    }

    /**
     * @type {IUnknown} 
     */
    SBESource {
        get => this.get_SBESource()
    }

    /**
     * The get_Start method retrieves the start time.
     * @returns {Integer} Pointer to a variable that receives the start time, in hundredths of seconds.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersource-get_start
     */
    get_Start() {
        result := ComCall(34, this, "int*", &lStart := 0, "HRESULT")
        return lStart
    }

    /**
     * The get_RecordingAttribute method retrieves the Stream Buffer Source filter that this object manages.
     * @remarks
     * The caller must release the returned <b>IUnknown</b> interface.
     * @returns {IUnknown} Receives a pointer to the filter's <b>IUnknown</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersource-get_recordingattribute
     */
    get_RecordingAttribute() {
        result := ComCall(35, this, "ptr*", &pRecordingAttribute := 0, "HRESULT")
        return IUnknown(pRecordingAttribute)
    }

    /**
     * The CurrentRatings method retrieves the current ratings information from the data source.
     * @param {Pointer<EnTvRat_System>} pEnSystem Pointer to a variable that receives the rating system, as an <a href="https://docs.microsoft.com/previous-versions/dd375612(v=vs.85)">EnTvRat_System</a> enumeration value.
     * @param {Pointer<EnTvRat_GenericLevel>} pEnRating Receives the rating level, as an <a href="https://docs.microsoft.com/previous-versions/dd375610(v=vs.85)">EnTvRat_GenericLevel</a> enumeration value.
     * @param {Pointer<Integer>} pBfEnAttr Pointer to a variable that receives the ratings attributes, as a bitwise combination of zero or more flags from the <a href="https://docs.microsoft.com/previous-versions/dd318226(v=vs.85)">BfEnTvRat_GenericAttributes</a> enumeration.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersource-currentratings
     */
    CurrentRatings(pEnSystem, pEnRating, pBfEnAttr) {
        pEnSystemMarshal := pEnSystem is VarRef ? "int*" : "ptr"
        pEnRatingMarshal := pEnRating is VarRef ? "int*" : "ptr"
        pBfEnAttrMarshal := pBfEnAttr is VarRef ? "int*" : "ptr"

        result := ComCall(36, this, pEnSystemMarshal, pEnSystem, pEnRatingMarshal, pEnRating, pBfEnAttrMarshal, pBfEnAttr, "HRESULT")
        return result
    }

    /**
     * The MaxRatingsLevel method specifies the maximum ratings level the object is permitted to play.
     * @param {EnTvRat_System} enSystem Specifies the rating system, as an <a href="https://docs.microsoft.com/previous-versions/dd375612(v=vs.85)">EnTvRat_System</a> enumeration value.
     * @param {EnTvRat_GenericLevel} enRating Specifies the maximum rating level, as an <a href="https://docs.microsoft.com/previous-versions/dd375610(v=vs.85)">EnTvRat_GenericLevel</a> enumeration value.
     * @param {Integer} lbfEnAttr Specifies zero or more ratings attributes, as a bitwise combination of flags from the <a href="https://docs.microsoft.com/previous-versions/dd318226(v=vs.85)">BfEnTvRat_GenericAttributes</a> enumeration.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersource-maxratingslevel
     */
    MaxRatingsLevel(enSystem, enRating, lbfEnAttr) {
        result := ComCall(37, this, EnTvRat_System, enSystem, EnTvRat_GenericLevel, enRating, "int", lbfEnAttr, "HRESULT")
        return result
    }

    /**
     * The put_BlockUnrated method specifies whether to block unrated content.
     * @param {VARIANT_BOOL} bBlock 
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersource-put_blockunrated
     */
    put_BlockUnrated(bBlock) {
        result := ComCall(38, this, VARIANT_BOOL, bBlock, "HRESULT")
        return result
    }

    /**
     * The put_UnratedDelay method specifies how long the Video Control will play unrated content before blocking it. The value is ignored until the put_BlockUnrated method is called with the value VARIANT_TRUE.
     * @param {Integer} dwDelay Specifies the delay before blocking unrated content, in milliseconds.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersource-put_unrateddelay
     */
    put_UnratedDelay(dwDelay) {
        result := ComCall(39, this, "int", dwDelay, "HRESULT")
        return result
    }

    /**
     * The get_SBESource method retrieves a pointer to the Stream Buffer Source filter.
     * @remarks
     * The caller must release the <b>IUnknown</b> interface.
     * @returns {IUnknown} Receives a pointer to the filter's <b>IUnknown</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersource-get_sbesource
     */
    get_SBESource() {
        result := ComCall(40, this, "ptr*", &sbeFilter := 0, "HRESULT")
        return IUnknown(sbeFilter)
    }

    Query(iid) {
        if (IMSVidStreamBufferSource.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Start := CallbackCreate(GetMethod(implObj, "get_Start"), flags, 2)
        this.vtbl.get_RecordingAttribute := CallbackCreate(GetMethod(implObj, "get_RecordingAttribute"), flags, 2)
        this.vtbl.CurrentRatings := CallbackCreate(GetMethod(implObj, "CurrentRatings"), flags, 4)
        this.vtbl.MaxRatingsLevel := CallbackCreate(GetMethod(implObj, "MaxRatingsLevel"), flags, 4)
        this.vtbl.put_BlockUnrated := CallbackCreate(GetMethod(implObj, "put_BlockUnrated"), flags, 2)
        this.vtbl.put_UnratedDelay := CallbackCreate(GetMethod(implObj, "put_UnratedDelay"), flags, 2)
        this.vtbl.get_SBESource := CallbackCreate(GetMethod(implObj, "get_SBESource"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Start)
        CallbackFree(this.vtbl.get_RecordingAttribute)
        CallbackFree(this.vtbl.CurrentRatings)
        CallbackFree(this.vtbl.MaxRatingsLevel)
        CallbackFree(this.vtbl.put_BlockUnrated)
        CallbackFree(this.vtbl.put_UnratedDelay)
        CallbackFree(this.vtbl.get_SBESource)
    }
}
