#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\IDWriteFontCollection2.ahk

/**
 * This interface encapsulates a set of fonts, such as the set of fonts installed on the system, or the set of fonts in a particular directory. The font collection API can be used to discover what font families and fonts are available, and to obtain some metadata about the fonts. (IDWriteFontCollection3)
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontcollection3
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontCollection3 extends IDWriteFontCollection2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontCollection3
     * @type {Guid}
     */
    static IID => Guid("{a4d055a6-f9e3-4e25-93b7-9e309f3af8e9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetExpirationEvent"]

    /**
     * Retrieves the expiration event for the font set, if any. The expiration event is set on a system font set object if it is out of date due to fonts being installed, uninstalled, or updated. (IDWriteFontCollection3::GetExpirationEvent)
     * @remarks
     * You mustn't call **CloseHandle** on the returned event handle. The handle is owned by the font set object, and it remains valid as long as you hold a reference to the font set. You can wait on the returned event, or use [RegisterWaitForSingleObject](../winbase/nf-winbase-registerwaitforsingleobject.md) to request a callback when the event is set.
     * @returns {HANDLE} Type: **[HANDLE](/windows/win32/winprog/windows-data-types)**
     * 
     * An event handle, if called on the system font set, or `nullptr` if called on a custom font set.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontcollection3-getexpirationevent
     */
    GetExpirationEvent() {
        result := ComCall(13, this, "ptr")
        resultHandle := HANDLE({Value: result}, True)
        return resultHandle
    }
}
