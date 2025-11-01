#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implemented by the text analyzer's client to provide text to the analyzer.
 * @remarks
 * 
  * If any of these callbacks returns an error, then the analysis functions will stop prematurely and return a callback error. Note that rather than return E_NOTIMPL,
  *  an application should stub the method and return a constant/null and S_OK.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/nn-dwrite-idwritetextanalysissource
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteTextAnalysisSource extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteTextAnalysisSource
     * @type {Guid}
     */
    static IID => Guid("{688e1a58-5094-47c8-adc8-fbcea60ae92b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTextAtPosition", "GetTextBeforePosition", "GetParagraphReadingDirection", "GetLocaleName", "GetNumberSubstitution"]

    /**
     * 
     * @param {Integer} textPosition 
     * @param {Pointer<Pointer<Integer>>} textString 
     * @param {Pointer<Integer>} textLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextanalysissource-gettextatposition
     */
    GetTextAtPosition(textPosition, textString, textLength) {
        textLengthMarshal := textLength is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", textPosition, "ptr*", textString, textLengthMarshal, textLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} textPosition 
     * @param {Pointer<Pointer<Integer>>} textString 
     * @param {Pointer<Integer>} textLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextanalysissource-gettextbeforeposition
     */
    GetTextBeforePosition(textPosition, textString, textLength) {
        textLengthMarshal := textLength is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", textPosition, "ptr*", textString, textLengthMarshal, textLength, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextanalysissource-getparagraphreadingdirection
     */
    GetParagraphReadingDirection() {
        result := ComCall(5, this, "int")
        return result
    }

    /**
     * 
     * @param {Integer} textPosition 
     * @param {Pointer<Integer>} textLength 
     * @param {Pointer<Pointer<Integer>>} localeName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextanalysissource-getlocalename
     */
    GetLocaleName(textPosition, textLength, localeName) {
        textLengthMarshal := textLength is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", textPosition, textLengthMarshal, textLength, "ptr*", localeName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} textPosition 
     * @param {Pointer<Integer>} textLength 
     * @param {Pointer<IDWriteNumberSubstitution>} numberSubstitution 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextanalysissource-getnumbersubstitution
     */
    GetNumberSubstitution(textPosition, textLength, numberSubstitution) {
        textLengthMarshal := textLength is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "uint", textPosition, textLengthMarshal, textLength, "ptr*", numberSubstitution, "HRESULT")
        return result
    }
}
