#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\IInkRecognizer.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * . (IInkRecognizers)
 * @see https://learn.microsoft.com/windows/win32/api//content/msinkaut/nn-msinkaut-iinkrecognizers
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkRecognizers extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkRecognizers
     * @type {Guid}
     */
    static IID => Guid("{9ccc4f12-b0b7-4a8b-bf58-4aeca4e8cefd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get__NewEnum", "GetDefaultRecognizer", "Item"]

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * Gets the number of objects or collections contained in a collection. (IInkRecognizers.get_Count)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/msinkaut/nf-msinkaut-iinkrecognizers-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &Count := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Count
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &_NewEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(_NewEnum)
    }

    /**
     * Retrieves the default recognizer for a known language, specified by a national language support (NLS) language code identifier (LCID).
     * @remarks
     * Each language can have a default recognizer. For example, a user can have a default recognizer for U.S. English and a default recognizer for French. If no locale is specified, this method returns the recognizer for the active input locale. To select the active input locale, in the Regional and Language Options in ControlPanel, on the Languages tab, users click Details, and then select the Default input language.
     * 
     * The default value of the <i>lcid</i> parameter is 0.
     * 
     * This method generates an error if the <i>lcid</i> parameter is not a known locale or if a recognizer is not installed for the requested locale.
     * 
     * <b>GetDefaultRecognizer</b> first checks if there is a matching recognizer for the user's input locale. If there is none, it checks if there is a matching recognizer for the current system locale.
     * 
     * For more information about NLS, see <a href="https://docs.microsoft.com/windows/desktop/Intl/nls-terminology">NLS Terminology</a>.
     * @param {Integer} lcid The LCID locale identifier of the language for which you are retrieving the default recognizer. If <i>lcid</i> is 0, the method uses the user's locale setting to determine which default recognizer to retrieve. If the user has not specified a locale in Regional Options, the method uses the locale that was specified for the computer. The default value is 0.
     * @returns {IInkRecognizer} When this method returns, contains a pointer to the requested recognizer.
     * @see https://learn.microsoft.com/windows/win32/api//content/msinkaut/nf-msinkaut-iinkrecognizers-getdefaultrecognizer
     */
    GetDefaultRecognizer(lcid) {
        result := ComCall(9, this, "int", lcid, "ptr*", &DefaultRecognizer := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInkRecognizer(DefaultRecognizer)
    }

    /**
     * Retrieves the IInkRecognizer object at the specified index within the InkRecognizers collection.
     * @remarks
     * An error occurs if the index doesn't match any existing member of the collection.
     * @param {Integer} Index The zero-based index of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkrecognizer">IInkRecognizer</a> object to get.
     * @returns {IInkRecognizer} When this method returns, contains a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkrecognizer">IInkRecognizer</a> object at the specified index within the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms702438(v=vs.85)">InkRecognizers</a> collection.
     * @see https://learn.microsoft.com/windows/win32/api//content/msinkaut/nf-msinkaut-iinkrecognizers-item
     */
    Item(Index) {
        result := ComCall(10, this, "int", Index, "ptr*", &InkRecognizer := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInkRecognizer(InkRecognizer)
    }
}
