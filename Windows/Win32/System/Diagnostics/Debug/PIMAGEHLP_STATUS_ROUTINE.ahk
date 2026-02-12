#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * An application-defined callback function used with the BindImageEx function. The status routine is called during the process of the image binding.
 * @remarks
 * All ImageHlp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
 * 
 * The following code fragment describes how to use the <i>Va</i> value when the status is BindImageComplete.
 * 
 * 
 * ```cpp
 * case BindImageComplete:
 *     if (fVerbose) {
 *         fprintf(stderr, "BIND: Details of binding %s\n", ImageName );
 *         NewImports = (PIMAGE_BOUND_IMPORT_DESCRIPTOR)Va;
 *         NewImport = NewImports;
 *         while (NewImport->OffsetModuleName) {
 *             fprintf( stderr, "    Import from %s [%x]",
 *                      (LPSTR)NewImports + NewImport->OffsetModuleName,
 *                      NewImport->TimeDateStamp
 *                    );
 *             if (NewImport->NumberOfModuleForwarderRefs != 0) {
 *                 fprintf( stderr, " with %u forwarders", NewImport-> 
 *                          NumberOfModuleForwarderRefs );
 *             }
 *             fprintf( stderr, "\n" );
 *             NewForwarder = (PIMAGE_BOUND_FORWARDER_REF)(NewImport+1);
 *             for (i=0; i<NewImport->NumberOfModuleForwarderRefs; i++) 
 *             {
 *                 fprintf( stderr, "        Forward to %s [%x]\n",
 *                    (LPSTR)NewImports + NewForwarder->OffsetModuleName,
 *                    NewForwarder->TimeDateStamp);
 *                 NewForwarder += 1;
 *             }
 *             NewImport = (PIMAGE_BOUND_IMPORT_DESCRIPTOR)NewForwarder;
 *         }
 *     }
 *     break;
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api//content/imagehlp/nc-imagehlp-pimagehlp_status_routine
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class PIMAGEHLP_STATUS_ROUTINE extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Integer} Reason 
     * @param {PSTR} ImageName 
     * @param {PSTR} DllName 
     * @param {Pointer} Va 
     * @param {Pointer} Parameter 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Reason, ImageName, DllName, Va, Parameter) {
        ImageName := ImageName is String ? StrPtr(ImageName) : ImageName
        DllName := DllName is String ? StrPtr(DllName) : DllName

        result := ComCall(3, this, "int", Reason, "ptr", ImageName, "ptr", DllName, "ptr", Va, "ptr", Parameter, "int")
        return result
    }
}
