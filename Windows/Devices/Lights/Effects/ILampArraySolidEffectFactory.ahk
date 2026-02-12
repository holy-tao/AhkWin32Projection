#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\LampArraySolidEffect.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Lights.Effects
 * @version WindowsRuntime 1.4
 */
class ILampArraySolidEffectFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILampArraySolidEffectFactory
     * @type {Guid}
     */
    static IID => Guid("{f862a32c-5576-4341-961b-aee1f13cf9dd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance"]

    /**
     * The CWbemGlueFactory class is part of the WMI Provider Framework. The Provider Framework implements methods of this interface internally to create new instances of classes for the provider.
     * @remarks
     * The destructor for the class is <b>CWbemGlueFactory::~CWbemGlueFactory.</b>
     * @param {LampArray} lampArray_ 
     * @param {Integer} lampIndexes_length 
     * @param {Pointer<Integer>} lampIndexes 
     * @returns {LampArraySolidEffect} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(lampArray_, lampIndexes_length, lampIndexes) {
        lampIndexesMarshal := lampIndexes is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "ptr", lampArray_, "uint", lampIndexes_length, lampIndexesMarshal, lampIndexes, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LampArraySolidEffect(value)
    }
}
