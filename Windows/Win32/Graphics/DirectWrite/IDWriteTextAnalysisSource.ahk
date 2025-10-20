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
     * 
     * @param {Integer} textPosition 
     * @param {Pointer<UInt16>} textString 
     * @param {Pointer<UInt32>} textLength 
     * @returns {HRESULT} 
     */
    GetTextAtPosition(textPosition, textString, textLength) {
        result := ComCall(3, this, "uint", textPosition, "ushort*", textString, "uint*", textLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} textPosition 
     * @param {Pointer<UInt16>} textString 
     * @param {Pointer<UInt32>} textLength 
     * @returns {HRESULT} 
     */
    GetTextBeforePosition(textPosition, textString, textLength) {
        result := ComCall(4, this, "uint", textPosition, "ushort*", textString, "uint*", textLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetParagraphReadingDirection() {
        result := ComCall(5, this, "int")
        return result
    }

    /**
     * 
     * @param {Integer} textPosition 
     * @param {Pointer<UInt32>} textLength 
     * @param {Pointer<UInt16>} localeName 
     * @returns {HRESULT} 
     */
    GetLocaleName(textPosition, textLength, localeName) {
        result := ComCall(6, this, "uint", textPosition, "uint*", textLength, "ushort*", localeName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} textPosition 
     * @param {Pointer<UInt32>} textLength 
     * @param {Pointer<IDWriteNumberSubstitution>} numberSubstitution 
     * @returns {HRESULT} 
     */
    GetNumberSubstitution(textPosition, textLength, numberSubstitution) {
        result := ComCall(7, this, "uint", textPosition, "uint*", textLength, "ptr", numberSubstitution, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
