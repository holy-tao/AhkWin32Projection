#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IEnumString.ahk
#Include .\ITfInputScope.ahk

/**
 * The ITfInputScope2 interface is used by the text input processors to get the IEnumString interface pointer and this IEnumString interface enumerates the word list that the application specified for this context.
 * @see https://docs.microsoft.com/windows/win32/api//inputscope/nn-inputscope-itfinputscope2
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfInputScope2 extends ITfInputScope{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfInputScope2
     * @type {Guid}
     */
    static IID => Guid("{5731eaa0-6bc2-4681-a532-92fbb74d7c41}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumWordList"]

    /**
     * ITfInputScope2::EnumWordList method
     * @returns {IEnumString} A pointer to obtain the IEnumString interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//inputscope/nf-inputscope-itfinputscope2-enumwordlist
     */
    EnumWordList() {
        result := ComCall(8, this, "ptr*", &ppEnumString := 0, "HRESULT")
        return IEnumString(ppEnumString)
    }
}
