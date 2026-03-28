#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IOpenService extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOpenService
     * @type {Guid}
     */
    static IID => Guid("{c2952ed1-6a89-4606-925f-1ed8b4be0630}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsDefault", "SetDefault", "GetID"]

    /**
     * IsDefault
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/mbn/element-isdefault
     */
    IsDefault() {
        result := ComCall(3, this, "int*", &pfIsDefault := 0, "HRESULT")
        return pfIsDefault
    }

    /**
     * Sets the default configuration for a communications device. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The winbase.h header defines SetDefaultCommConfig as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {BOOL} fDefault 
     * @param {HWND} _hwnd 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-setdefaultcommconfigw
     */
    SetDefault(fDefault, _hwnd) {
        _hwnd := _hwnd is Win32Handle ? NumGet(_hwnd, "ptr") : _hwnd

        result := ComCall(4, this, "int", fDefault, "ptr", _hwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetID() {
        pbstrID := BSTR()
        result := ComCall(5, this, "ptr", pbstrID, "HRESULT")
        return pbstrID
    }
}
