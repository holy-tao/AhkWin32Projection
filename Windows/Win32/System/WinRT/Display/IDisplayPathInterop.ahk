#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\HANDLE.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * Creates an NT handle for controlling access to scanout on this path.
 * @remarks
 * Multiple processes can have handles of the same object, enabling use of the object for interprocess synchronization or sharing. These object-sharing mechanisms are available.
 * 
 * * A process can specify the object handle in a call to the [DuplicateHandle](../handleapi/nf-handleapi-duplicatehandle.md) function to create a duplicate handle that can be used by another process.
 * * A process can specify the name of the object in a call to the [IDisplayDeviceInterop.OpenSharedHandle](nf-windows-devices-display-core-interop-idisplaydeviceinterop-opensharedhandle.md) function.
 * 
 * Use the [CloseHandle](../handleapi/nf-handleapi-closehandle.md) function to close the handle. The system closes the handle automatically when the process terminates. The object is destroyed when its last handle has been closed and its last interface reference has been released.
 * @see https://learn.microsoft.com/windows/win32/api//content/windows.devices.display.core.interop/nf-windows-devices-display-core-interop-idisplaypathinterop-createsourcepresentationhandle
 * @namespace Windows.Win32.System.WinRT.Display
 * @version v4.0.30319
 */
class IDisplayPathInterop extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayPathInterop
     * @type {Guid}
     */
    static IID => Guid("{a6ba4205-e59e-4e71-b25b-4e436d21ee3d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateSourcePresentationHandle", "GetSourceId"]

    /**
     * Creates an NT handle for controlling access to scanout on this path.
     * @remarks
     * Multiple processes can have handles of the same object, enabling use of the object for interprocess synchronization or sharing. These object-sharing mechanisms are available.
     * 
     * * A process can specify the object handle in a call to the [DuplicateHandle](../handleapi/nf-handleapi-duplicatehandle.md) function to create a duplicate handle that can be used by another process.
     * * A process can specify the name of the object in a call to the [IDisplayDeviceInterop.OpenSharedHandle](nf-windows-devices-display-core-interop-idisplaydeviceinterop-opensharedhandle.md) function.
     * 
     * Use the [CloseHandle](../handleapi/nf-handleapi-closehandle.md) function to close the handle. The system closes the handle automatically when the process terminates. The object is destroyed when its last handle has been closed and its last interface reference has been released.
     * @returns {HANDLE} Type: **[HANDLE](/windows/win32/winprog/windows-data-types)\***
     * 
     * A pointer to a **HANDLE** that receives the newly created source presentation object.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.devices.display.core.interop/nf-windows-devices-display-core-interop-idisplaypathinterop-createsourcepresentationhandle
     */
    CreateSourcePresentationHandle() {
        pValue := HANDLE()
        result := ComCall(3, this, "ptr", pValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * TBDI
     * @returns {Integer} The unique identifier.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.devices.display.core.interop/nf-windows-devices-display-core-interop-idisplaypathinterop-getsourceid
     */
    GetSourceId() {
        result := ComCall(4, this, "uint*", &pSourceId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pSourceId
    }
}
