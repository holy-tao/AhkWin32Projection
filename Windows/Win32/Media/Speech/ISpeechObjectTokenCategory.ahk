#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISpeechDataKey.ahk
#Include .\ISpeechObjectTokens.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechObjectTokenCategory extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechObjectTokenCategory
     * @type {Guid}
     */
    static IID => Guid("{ca7eac50-2d01-4145-86d4-5ae7d70f4469}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "put_Default", "get_Default", "SetId", "GetDataKey", "EnumerateTokens"]

    /**
     * @type {BSTR} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {BSTR} 
     */
    Default {
        get => this.get_Default()
        set => this.put_Default(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Id() {
        Id := BSTR()
        result := ComCall(7, this, "ptr", Id, "HRESULT")
        return Id
    }

    /**
     * 
     * @param {BSTR} TokenId 
     * @returns {HRESULT} 
     */
    put_Default(TokenId) {
        TokenId := TokenId is String ? BSTR.Alloc(TokenId).Value : TokenId

        result := ComCall(8, this, "ptr", TokenId, "HRESULT")
        return result
    }

    /**
     * Gets or sets the default drawing attributes to use when drawing and displaying ink. (IInkCollector.get_DefaultDrawingAttributes)
     * @remarks
     * The drawing attributes specified with this property are the attributes that are assigned to a new cursor.
     * 
     * The default drawing attributes are as follows:
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_antialiased">AntiAliased</a> = <b>TRUE</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_color">Color</a> = <b>BLACK</b> (RGB(0,0,0)) if not in High Contrast mode; otherwise, Color=COLOR_WINDOWTEXT.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_fittocurve">FitToCurve</a> = <b>FALSE</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_height">Height</a> = 1 (in ink space units)
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_ignorepressure">IgnorePressure</a> = <b>FALSE</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_pentip">PenTip</a> = <b>Ball</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_rasteroperation">RasterOperation</a> = <b>CopyPen</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_transparency">Transparency</a> = 0 (totally opaque)
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdrawingattributes-get_width">Width</a> = 53 (in ink space units)
     * 
     * To set different attributes on a new cursor, use the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcursor-get_drawingattributes">DrawingAttributes</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkcursor">IInkCursor</a> object.
     * 
     * To change the drawing attributes of a single stroke, use the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcursor-get_drawingattributes">DrawingAttributes</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a> object. To change the drawing attributes of a collection of strokes, call the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkstrokes-modifydrawingattributes">ModifyDrawingAttributes</a> method of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)">InkStrokes</a> collection.
     * 
     * <div class="alert"><b>Note</b>  The <b>DefaultDrawingAttributes</b> property contains the drawing attributes that all cursors use unless they set their own <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcursor-get_drawingattributes">DrawingAttributes</a> property. For example, a new <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkcursor">IInkCursor</a> object uses <b>DefaultDrawingAttributes</b>, and an old <b>IInkCursor</b> object on which the <b>DrawingAttributes</b> is set to <b>NULL</b> also uses <b>DefaultDrawingAttributes</b>.</div>
     * <div> </div>
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkcollector-get_defaultdrawingattributes
     */
    get_Default() {
        TokenId := BSTR()
        result := ComCall(9, this, "ptr", TokenId, "HRESULT")
        return TokenId
    }

    /**
     * Sets the specified identifier string in the volume's metadata.
     * @param {BSTR} Id 
     * @param {VARIANT_BOOL} CreateIfNotExist 
     * @returns {HRESULT} Type: **uint32**
     * 
     * This method returns one of the following codes or another error code if it fails.
     * 
     * 
     * 
     * | Return code/value                                                                                                                                                                  | Description                                                                                                     |
     * |------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> <dt>0 (0x0)</dt> </dl>                                  | The method was successful.<br/>                                                                           |
     * | <dl> <dt>**FVE\_E\_LOCKED\_VOLUME**</dt> <dt>2150694912 (0x80310000)</dt> </dl> | This drive is locked by BitLocker Drive Encryption. You must unlock this volume from Control Panel. <br/> |
     * | <dl> <dt>**FVE\_E\_NOT\_ACTIVATED**</dt> <dt>2150694920 (0x80310008)</dt> </dl> | BitLocker is not enabled on the volume. Add a key protector to enable BitLocker. <br/>                    |
     * @see https://learn.microsoft.com/windows/win32/SecProv/setidentificationfield-win32-encryptablevolume
     */
    SetId(Id, CreateIfNotExist) {
        Id := Id is String ? BSTR.Alloc(Id).Value : Id

        result := ComCall(10, this, "ptr", Id, "short", CreateIfNotExist, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Location 
     * @returns {ISpeechDataKey} 
     */
    GetDataKey(Location) {
        result := ComCall(11, this, "int", Location, "ptr*", &DataKey := 0, "HRESULT")
        return ISpeechDataKey(DataKey)
    }

    /**
     * 
     * @param {BSTR} RequiredAttributes 
     * @param {BSTR} OptionalAttributes 
     * @returns {ISpeechObjectTokens} 
     */
    EnumerateTokens(RequiredAttributes, OptionalAttributes) {
        RequiredAttributes := RequiredAttributes is String ? BSTR.Alloc(RequiredAttributes).Value : RequiredAttributes
        OptionalAttributes := OptionalAttributes is String ? BSTR.Alloc(OptionalAttributes).Value : OptionalAttributes

        result := ComCall(12, this, "ptr", RequiredAttributes, "ptr", OptionalAttributes, "ptr*", &Tokens := 0, "HRESULT")
        return ISpeechObjectTokens(Tokens)
    }
}
