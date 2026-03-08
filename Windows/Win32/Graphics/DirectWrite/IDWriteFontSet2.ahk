#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\IDWriteFontSet1.ahk

/**
 * Represents a font set. (IDWriteFontSet2)
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontset2
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontSet2 extends IDWriteFontSet1{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontSet2
     * @type {Guid}
     */
    static IID => Guid("{dc7ead19-e54c-43af-b2da-4e2b79ba3f7f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 26

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetExpirationEvent"]

    /**
     * Retrieves the expiration event for the font set, if any. The expiration event is set on a system font set object if it is out of date due to fonts being installed, uninstalled, or updated. (IDWriteFontSet2::GetExpirationEvent)
     * @remarks
     * You mustn't call **CloseHandle** on the returned event handle. The handle is owned by the font set object, and it remains valid as long as you hold a reference to the font set. You can wait on the returned event, or use [RegisterWaitForSingleObject](../winbase/nf-winbase-registerwaitforsingleobject.md) to request a callback when the event is set.
     * @returns {HANDLE} Type: **[HANDLE](/windows/win32/winprog/windows-data-types)**
     * 
     * An event handle, if called on the system font set, or `nullptr` if called on a custom font set.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset2-getexpirationevent
     */
    GetExpirationEvent() {
        result := ComCall(26, this, "ptr")
        resultHandle := HANDLE({Value: result}, True)
        return resultHandle
    }
}
