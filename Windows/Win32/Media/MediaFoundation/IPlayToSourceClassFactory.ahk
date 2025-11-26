#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\WinRT\IInspectable.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Creates an instance of the PlayToSource object.
 * @remarks
 * 
 * To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a>. The CLSID is <b>CLSID_PlayToSourceClassFactory</b>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfsharingengine/nn-mfsharingengine-iplaytosourceclassfactory
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IPlayToSourceClassFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlayToSourceClassFactory
     * @type {Guid}
     */
    static IID => Guid("{842b32a3-9b9b-4d1c-b3f3-49193248a554}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance"]

    /**
     * Creates an instance of the PlayToController object.
     * @param {Integer} dwFlags A bitwise <b>OR</b> of flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mfsharingengine/ne-mfsharingengine-playto_source_createflags">PLAYTO_SOURCE_CREATEFLAGS</a> enumeration.
     * @param {IPlayToControl} pControl A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfsharingengine/nn-mfsharingengine-iplaytocontrol">IPlayToControl</a> interface.
     * @returns {IInspectable} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/inspectable/nn-inspectable-iinspectable">IInspectable</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfsharingengine/nf-mfsharingengine-iplaytosourceclassfactory-createinstance
     */
    CreateInstance(dwFlags, pControl) {
        result := ComCall(3, this, "uint", dwFlags, "ptr", pControl, "ptr*", &ppSource := 0, "HRESULT")
        return IInspectable(ppSource)
    }
}
