#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IInkStrokes.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IInkTransform.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Represents a single structural element within an IInkDivisionResult object.
 * @remarks
 * 
 * Use the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut15/nf-msinkaut15-iinkdivisionunits-item">Item</a> method to return a single element from a <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut15/nn-msinkaut15-iinkdivisionunits">DivisionUnits</a> collection.
 * 
 * If you define a class that implements this interface, the new class will not interact correctly with the Tablet PC application programming interfaces (APIs).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut15/nn-msinkaut15-iinkdivisionunit
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkDivisionUnit extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkDivisionUnit
     * @type {Guid}
     */
    static IID => Guid("{85aee342-48b0-4244-9dd5-1ed435410fab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Strokes", "get_DivisionType", "get_RecognizedString", "get_RotationTransform"]

    /**
     * @type {IInkStrokes} 
     */
    Strokes {
        get => this.get_Strokes()
    }

    /**
     * @type {Integer} 
     */
    DivisionType {
        get => this.get_DivisionType()
    }

    /**
     * @type {BSTR} 
     */
    RecognizedString {
        get => this.get_RecognizedString()
    }

    /**
     * @type {IInkTransform} 
     */
    RotationTransform {
        get => this.get_RotationTransform()
    }

    /**
     * 
     * @returns {IInkStrokes} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut15/nf-msinkaut15-iinkdivisionunit-get_strokes
     */
    get_Strokes() {
        result := ComCall(7, this, "ptr*", &Strokes := 0, "HRESULT")
        return IInkStrokes(Strokes)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut15/nf-msinkaut15-iinkdivisionunit-get_divisiontype
     */
    get_DivisionType() {
        result := ComCall(8, this, "int*", &divisionType := 0, "HRESULT")
        return divisionType
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_RecognizedString() {
        RecoString := BSTR()
        result := ComCall(9, this, "ptr", RecoString, "HRESULT")
        return RecoString
    }

    /**
     * 
     * @returns {IInkTransform} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut15/nf-msinkaut15-iinkdivisionunit-get_rotationtransform
     */
    get_RotationTransform() {
        result := ComCall(10, this, "ptr*", &RotationTransform := 0, "HRESULT")
        return IInkTransform(RotationTransform)
    }
}
