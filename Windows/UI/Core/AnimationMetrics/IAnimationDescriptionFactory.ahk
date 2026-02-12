#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\AnimationDescription.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Core.AnimationMetrics
 * @version WindowsRuntime 1.4
 */
class IAnimationDescriptionFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAnimationDescriptionFactory
     * @type {Guid}
     */
    static IID => Guid("{c6e27abe-c1fb-48b5-9271-ecc70ac86ef0}")

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
     * @param {Integer} effect_ 
     * @param {Integer} target 
     * @returns {AnimationDescription} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(effect_, target) {
        result := ComCall(6, this, "int", effect_, "int", target, "ptr*", &animation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AnimationDescription(animation)
    }
}
