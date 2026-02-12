#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IAzApplication2.ahk
#Include .\IAzAuthorizationStore.ahk

/**
 * Inherits from the AzAuthorizationStore object and implements methods to create and open IAzApplication2 objects.
 * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nn-azroles-iazauthorizationstore2
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzAuthorizationStore2 extends IAzAuthorizationStore{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAzAuthorizationStore2
     * @type {Guid}
     */
    static IID => Guid("{b11e5584-d577-4273-b6c5-0973e0f8e80d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 58

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OpenApplication2", "CreateApplication2"]

    /**
     * Opens the IAzApplication2 object with the specified name.
     * @param {BSTR} bstrApplicationName The name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication2">IAzApplication2</a> object to open.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {IAzApplication2} A pointer to a pointer to the opened <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication2">IAzApplication2</a> object.
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iazauthorizationstore2-openapplication2
     */
    OpenApplication2(bstrApplicationName, varReserved) {
        if(bstrApplicationName is String) {
            pin := BSTR.Alloc(bstrApplicationName)
            bstrApplicationName := pin.Value
        }

        result := ComCall(58, this, "ptr", bstrApplicationName, "ptr", varReserved, "ptr*", &ppApplication := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAzApplication2(ppApplication)
    }

    /**
     * Creates an IAzApplication2 object by using the specified name.
     * @remarks
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-submit">IAzApplication::Submit</a> method to persist any changes made by the returned object.
     * 
     * The returned <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication2">IAzApplication2</a> object is an immediate child object of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazauthorizationstore2">IAzAuthorizationStore2</a> object.
     * @param {BSTR} bstrApplicationName The name for the new <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication2">IAzApplication2</a> object.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {IAzApplication2} A pointer to a pointer to the created <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication2">IAzApplication2</a> object.
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iazauthorizationstore2-createapplication2
     */
    CreateApplication2(bstrApplicationName, varReserved) {
        if(bstrApplicationName is String) {
            pin := BSTR.Alloc(bstrApplicationName)
            bstrApplicationName := pin.Value
        }

        result := ComCall(59, this, "ptr", bstrApplicationName, "ptr", varReserved, "ptr*", &ppApplication := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAzApplication2(ppApplication)
    }
}
