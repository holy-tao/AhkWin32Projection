#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMProfile.ahk

/**
 * The IWMProfile2 interface exposes the globally unique identifier for a system profile.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmprofile2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMProfile2 extends IWMProfile{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMProfile2
     * @type {Guid}
     */
    static IID => Guid("{07e72d33-d94e-4be7-8843-60ae5ff7e5f5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 21

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProfileID"]

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile2-getprofileid
     */
    GetProfileID() {
        pguidID := Guid()
        result := ComCall(21, this, "ptr", pguidID, "HRESULT")
        return pguidID
    }
}
