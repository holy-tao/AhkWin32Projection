#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ITextRange2.ahk

/**
 * Currently, this interface contains no methods other than those inherited from ITextRange2.
 * @see https://docs.microsoft.com/windows/win32/api//tom/nn-tom-itextselection2
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class ITextSelection2 extends ITextRange2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextSelection2
     * @type {Guid}
     */
    static IID => Guid("{c241f5e1-7206-11d8-a2c7-00a0d1d6c6b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 108

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
