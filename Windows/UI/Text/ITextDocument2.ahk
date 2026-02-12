#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Extends the ITextDocument interface, adding methods that enable the Input Method Editor (IME) to drive the rich edit control, and methods to retrieve other interfaces such as ITextDisplays, ITextRange2, ITextFont2, ITextPara2, and so on.
 * @see https://learn.microsoft.com/windows/win32/api//content/tom/nn-tom-itextdocument2
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class ITextDocument2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextDocument2
     * @type {Guid}
     */
    static IID => Guid("{f2311112-8c89-49c9-9118-f057cbb814ee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AlignmentIncludesTrailingWhitespace", "put_AlignmentIncludesTrailingWhitespace", "get_IgnoreTrailingCharacterSpacing", "put_IgnoreTrailingCharacterSpacing"]

    /**
     * @type {Boolean} 
     */
    AlignmentIncludesTrailingWhitespace {
        get => this.get_AlignmentIncludesTrailingWhitespace()
        set => this.put_AlignmentIncludesTrailingWhitespace(value)
    }

    /**
     * @type {Boolean} 
     */
    IgnoreTrailingCharacterSpacing {
        get => this.get_IgnoreTrailingCharacterSpacing()
        set => this.put_IgnoreTrailingCharacterSpacing(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AlignmentIncludesTrailingWhitespace() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AlignmentIncludesTrailingWhitespace(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IgnoreTrailingCharacterSpacing() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IgnoreTrailingCharacterSpacing(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
