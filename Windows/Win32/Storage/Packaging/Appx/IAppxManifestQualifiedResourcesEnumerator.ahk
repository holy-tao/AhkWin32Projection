#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAppxManifestQualifiedResource.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxManifestQualifiedResourcesEnumerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxManifestQualifiedResourcesEnumerator
     * @type {Guid}
     */
    static IID => Guid("{8ef6adfe-3762-4a8f-9373-2fc5d444c8d2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrent", "GetHasCurrent", "MoveNext"]

    /**
     * The GetCurrentActCtx function returns the handle to the active activation context of the calling thread.
     * @remarks
     * The calling thread is responsible for releasing the handle of the returned activation context. This function can return a null handle if no activation contexts have been activated by this thread. This is not an error.
     * @returns {IAppxManifestQualifiedResource} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-getcurrentactctx
     */
    GetCurrent() {
        result := ComCall(3, this, "ptr*", &resource := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAppxManifestQualifiedResource(resource)
    }

    /**
     * 
     * @returns {BOOL} 
     */
    GetHasCurrent() {
        result := ComCall(4, this, "int*", &hasCurrent := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return hasCurrent
    }

    /**
     * 
     * @returns {BOOL} 
     */
    MoveNext() {
        result := ComCall(5, this, "int*", &hasNext := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return hasNext
    }
}
