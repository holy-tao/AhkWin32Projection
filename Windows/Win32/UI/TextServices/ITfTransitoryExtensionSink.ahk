#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfTransitoryExtensionSink interface is implemented by the application that uses Transitory Extension dim. The application can track the changes that happened in the transitory extension by using this sink interface.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itftransitoryextensionsink
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfTransitoryExtensionSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfTransitoryExtensionSink
     * @type {Guid}
     */
    static IID => Guid("{a615096f-1c57-4813-8a15-55ee6e5a839c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnTransitoryExtensionUpdated"]

    /**
     * ITfTransitoryExtensionSink::OnTransitoryExtensionUpdated method
     * @param {ITfContext} pic [in] A pointer of <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcontext">ITfContext</a> interface. This is a context object in which the update happened.
     * @param {Integer} ecReadOnly [in] A read only edit cookie to access the <i>pic</i>. Using this edit cookie, the application can get the text that is contained in the context object.
     * @param {ITfRange} pResultRange [in] A pointer of the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> interface. This is the range of the result string (determined string).
     * @param {ITfRange} pCompositionRange [in] A pointer of the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> interface. This is the range of the current composition string.
     * @returns {BOOL} [out] A pointer to return the bool value. If it is true, TSF manager deletes the result range so only the current composition range remains in the transitory extension.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itftransitoryextensionsink-ontransitoryextensionupdated
     */
    OnTransitoryExtensionUpdated(pic, ecReadOnly, pResultRange, pCompositionRange) {
        result := ComCall(3, this, "ptr", pic, "uint", ecReadOnly, "ptr", pResultRange, "ptr", pCompositionRange, "int*", &pfDeleteResultRange := 0, "HRESULT")
        return pfDeleteResultRange
    }
}
