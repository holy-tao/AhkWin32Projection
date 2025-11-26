#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Specifies a method that retrieves a class object.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-iclassactivator
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IClassActivator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IClassActivator
     * @type {Guid}
     */
    static IID => Guid("{00000140-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetClassObject"]

    /**
     * Retrieves a class object.
     * @param {Pointer<Guid>} rclsid The CLSID that identifies the class whose class object is to be retrieved.
     * @param {Integer} dwClassContext The context in which the class is expected to run. For a list of values, see the <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-clsctx">CLSCTX</a> enumeration.
     * @param {Integer} locale An LCID constant as defined in WinNls.h.
     * @param {Pointer<Guid>} riid The IID of the interface on the object to which a pointer is desired.
     * @returns {Pointer<Void>} The address of pointer variable that receives the interface pointer requested in <i>riid</i>. Upon successful return, *<i>ppv</i> contains the requested interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-iclassactivator-getclassobject
     */
    GetClassObject(rclsid, dwClassContext, locale, riid) {
        result := ComCall(3, this, "ptr", rclsid, "uint", dwClassContext, "uint", locale, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }
}
