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
     * Gets a block of text starting at the specified text position.
     * @param {Integer} textPosition Type: <b>UINT32</b>
     * 
     * The first position of the piece to obtain. All
     *     positions are in <b>UTF16</b> code units, not whole characters, which
     *          matters when supplementary characters are used.
     * @param {Pointer<Pointer<Integer>>} textString Type: <b>const WCHAR**</b>
     * 
     * When this method returns, contains an address of  the block of text as an array of characters to be retrieved from the text analysis.
     * @param {Pointer<Integer>} textLength Type: <b>UINT32*</b>
     * 
     * When this method returns, contains the number of <b>UTF16</b> units of the retrieved chunk.
     *          The returned length is not the length of the block, but the length     remaining in the block, from the specified position until its end.
     *          For example, querying for a position that is 75 positions into a 100-position block would return 25.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextanalysissource-gettextatposition
     */
    GetTextAtPosition(textPosition, textString, textLength) {
        textStringMarshal := textString is VarRef ? "ptr*" : "ptr"
        textLengthMarshal := textLength is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", textPosition, textStringMarshal, textString, textLengthMarshal, textLength, "HRESULT")
        return result
    }

    /**
     * Gets a block of text immediately preceding the specified position.
     * @param {Integer} textPosition Type: <b>UINT32</b>
     * 
     * The position immediately after the last position of the block of text to obtain.
     * @param {Pointer<Pointer<Integer>>} textString Type: <b>const WCHAR**</b>
     * 
     * When this method returns, contains an address of a pointer to the block of text, as an array of characters from the specified range.  The text range will be from <i>textPosition</i> to the front of the block.
     * @param {Pointer<Integer>} textLength Type: <b>UINT32*</b>
     * 
     * Number of UTF16 units of the retrieved block.
     *          The length returned is from the specified position to the front of
     *          the block.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextanalysissource-gettextbeforeposition
     */
    GetTextBeforePosition(textPosition, textString, textLength) {
        textStringMarshal := textString is VarRef ? "ptr*" : "ptr"
        textLengthMarshal := textLength is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", textPosition, textStringMarshal, textString, textLengthMarshal, textLength, "HRESULT")
        return result
    }

    /**
     * Gets the paragraph reading direction.
     * @returns {Integer} Type: <b><a href="/windows/win32/api/dwrite/ne-dwrite-dwrite_reading_direction">DWRITE_READING_DIRECTION</a></b>
     * 
     * The reading direction of the current paragraph.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextanalysissource-getparagraphreadingdirection
     */
    GetParagraphReadingDirection() {
        result := ComCall(5, this, "int")
        return result
    }

    /**
     * Gets the locale name on the range affected by the text analysis.
     * @param {Integer} textPosition Type: <b>UINT32</b>
     * 
     * The text position to examine.
     * @param {Pointer<Integer>} textLength Type: <b>UINT32*</b>
     * 
     * Contains the length of the text being affected by the text analysis up to the next differing locale.
     * @param {Pointer<Pointer<Integer>>} localeName Type: <b>const WCHAR**</b>
     * 
     * Contains an address of a  pointer to an array of characters which receives the locale name from the text affected by the text analysis. The array of characters is null-terminated.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextanalysissource-getlocalename
     */
    GetLocaleName(textPosition, textLength, localeName) {
        textLengthMarshal := textLength is VarRef ? "uint*" : "ptr"
        localeNameMarshal := localeName is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "uint", textPosition, textLengthMarshal, textLength, localeNameMarshal, localeName, "HRESULT")
        return result
    }

    /**
     * Gets the number substitution from the text range affected by the text analysis.
     * @param {Integer} textPosition Type: <b>UINT32</b>
     * 
     * The starting position from which to report.
     * @param {Pointer<Integer>} textLength Type: <b>UINT32*</b>
     * 
     * Contains  the length of the text, in characters, remaining in the text range up to the next differing number substitution.
     * @param {Pointer<IDWriteNumberSubstitution>} numberSubstitution Type: <b><a href="https://docs.microsoft.com/windows/win32/DirectWrite/idwritenumbersubstitution">IDWriteNumberSubstitution</a>**</b>
     * 
     * Contains an address of a pointer to an object, which was created with <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefactory-createnumbersubstitution">IDWriteFactory::CreateNumberSubstitution</a>, that holds the appropriate digits and numeric punctuation for a given locale.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetextanalysissource-getnumbersubstitution
     */
    GetNumberSubstitution(textPosition, textLength, numberSubstitution) {
        textLengthMarshal := textLength is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "uint", textPosition, textLengthMarshal, textLength, "ptr*", numberSubstitution, "HRESULT")
        return result
    }
}
