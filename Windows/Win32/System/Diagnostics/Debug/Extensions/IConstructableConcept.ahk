#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IModelObject.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IConstructableConcept extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConstructableConcept
     * @type {Guid}
     */
    static IID => Guid("{1a9409f1-f0e0-4b48-9a4e-5783548fb57a}")

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
     * The CWbemGlueFactory class is part of the WMI Provider Framework. The Provider Framework implements methods of this interface internally to create new instances of classes for the provider.
     * @remarks
     * The destructor for the class is <b>CWbemGlueFactory::~CWbemGlueFactory.</b>
     * @param {Integer} argCount 
     * @param {Pointer<IModelObject>} ppArguments 
     * @returns {IModelObject} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(argCount, ppArguments) {
        result := ComCall(3, this, "uint", argCount, "ptr*", ppArguments, "ptr*", &ppInstance := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IModelObject(ppInstance)
    }
}
