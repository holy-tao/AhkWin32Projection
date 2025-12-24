#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
#Include .\IMSVidFilePlayback.ahk

/**
 * The IMSVidStreamBufferSource interface represents the Stream Buffer Source filter within the Video Control.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidStreamBufferSource)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidstreambuffersource
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidStreamBufferSource extends IMSVidFilePlayback{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidStreamBufferSource
     * @type {Guid}
     */
    static IID => Guid("{eb0c8cf9-6950-4772-87b1-47d11cf3a02f}")

    /**
     * The class identifier for MSVidStreamBufferSource
     * @type {Guid}
     */
    static CLSID => Guid("{ad8e510d-217f-409b-8076-29c5e73b98e8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 34

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Start", "get_RecordingAttribute", "CurrentRatings", "MaxRatingsLevel", "put_BlockUnrated", "put_UnratedDelay", "get_SBESource"]

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
     * @type {HRESULT} 
     */
    BlockUnrated {
        set => this.put_BlockUnrated(value)
    }

    /**
     * @type {HRESULT} 
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
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidstreambuffersource-get_start
     */
    get_Start() {
        result := ComCall(34, this, "int*", &lStart := 0, "HRESULT")
        return lStart
    }

    /**
     * The get_RecordingAttribute method retrieves the Stream Buffer Source filter that this object manages.
     * @returns {IUnknown} Receives a pointer to the filter's <b>IUnknown</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidstreambuffersource-get_recordingattribute
     */
    get_RecordingAttribute() {
        result := ComCall(35, this, "ptr*", &pRecordingAttribute := 0, "HRESULT")
        return IUnknown(pRecordingAttribute)
    }

    /**
     * The CurrentRatings method retrieves the current ratings information from the data source.
     * @param {Pointer<Integer>} pEnSystem Pointer to a variable that receives the rating system, as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tvratings/ne-tvratings-entvrat_system">EnTvRat_System</a> enumeration value.
     * @param {Pointer<Integer>} pEnRating Receives the rating level, as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tvratings/ne-tvratings-entvrat_genericlevel">EnTvRat_GenericLevel</a> enumeration value.
     * @param {Pointer<Integer>} pBfEnAttr Pointer to a variable that receives the ratings attributes, as a bitwise combination of zero or more flags from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tvratings/ne-tvratings-bfentvrat_genericattributes">BfEnTvRat_GenericAttributes</a> enumeration.
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
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidstreambuffersource-currentratings
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
     * @param {Integer} enSystem Specifies the rating system, as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tvratings/ne-tvratings-entvrat_system">EnTvRat_System</a> enumeration value.
     * @param {Integer} enRating Specifies the maximum rating level, as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tvratings/ne-tvratings-entvrat_genericlevel">EnTvRat_GenericLevel</a> enumeration value.
     * @param {Integer} lbfEnAttr Specifies zero or more ratings attributes, as a bitwise combination of flags from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tvratings/ne-tvratings-bfentvrat_genericattributes">BfEnTvRat_GenericAttributes</a> enumeration.
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
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidstreambuffersource-maxratingslevel
     */
    MaxRatingsLevel(enSystem, enRating, lbfEnAttr) {
        result := ComCall(37, this, "int", enSystem, "int", enRating, "int", lbfEnAttr, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidstreambuffersource-put_blockunrated
     */
    put_BlockUnrated(bBlock) {
        result := ComCall(38, this, "short", bBlock, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidstreambuffersource-put_unrateddelay
     */
    put_UnratedDelay(dwDelay) {
        result := ComCall(39, this, "int", dwDelay, "HRESULT")
        return result
    }

    /**
     * The get_SBESource method retrieves a pointer to the Stream Buffer Source filter.
     * @returns {IUnknown} Receives a pointer to the filter's <b>IUnknown</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidstreambuffersource-get_sbesource
     */
    get_SBESource() {
        result := ComCall(40, this, "ptr*", &sbeFilter := 0, "HRESULT")
        return IUnknown(sbeFilter)
    }
}
