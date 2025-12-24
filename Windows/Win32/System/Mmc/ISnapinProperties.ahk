#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The ISnapinProperties interface enables a snap-in to initialize the snap-in's properties and receive notification when a property is added, changed, or deleted.
 * @see https://docs.microsoft.com/windows/win32/api//mmcobj/nn-mmcobj-isnapinproperties
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class ISnapinProperties extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISnapinProperties
     * @type {Guid}
     */
    static IID => Guid("{f7889da9-4a02-4837-bf89-1a6f2a021010}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "QueryPropertyNames", "PropertiesChanged"]

    /**
     * The Initialize method initializes a snap-in.
     * @param {Properties} pProperties <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/properties-collection">Properties</a> collection that can be used by the snap-in for initialization.
     * @returns {HRESULT} If successful, the return value is S_OK; otherwise, the return value is E_FAIL.
     * @see https://docs.microsoft.com/windows/win32/api//mmcobj/nf-mmcobj-isnapinproperties-initialize
     */
    Initialize(pProperties) {
        result := ComCall(3, this, "ptr", pProperties, "HRESULT")
        return result
    }

    /**
     * The QueryPropertyNames method returns the names of the properties used for the snap-in's configuration.
     * @param {ISnapinPropertiesCallback} pCallback A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmcobj/nn-mmcobj-isnapinpropertiescallback">ISnapinPropertiesCallback</a> interface; the snap-in can call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmcobj/nf-mmcobj-isnapinpropertiescallback-addpropertyname">ISnapinPropertiesCallback::AddPropertyName</a> to add the properties.
     * @returns {HRESULT} If successful, the return value is S_OK; otherwise, the return value is an error code.
     * @see https://docs.microsoft.com/windows/win32/api//mmcobj/nf-mmcobj-isnapinproperties-querypropertynames
     */
    QueryPropertyNames(pCallback) {
        result := ComCall(4, this, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * Called when a property is added, changed, or deleted.
     * @param {Integer} cProperties The number of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmcobj/ns-mmcobj-mmc_snapin_property">MMC_SNAPIN_PROPERTY</a> structures provided by <i>pProperties</i>.
     * @param {Pointer<MMC_SNAPIN_PROPERTY>} pProperties An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmcobj/ns-mmcobj-mmc_snapin_property">MMC_SNAPIN_PROPERTY</a> structures.
     * @returns {HRESULT} If successful, the return value is <b>S_OK</b>; a snap-in can prevent a change or deletion from occurring by returning <b>E_FAIL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mmcobj/nf-mmcobj-isnapinproperties-propertieschanged
     */
    PropertiesChanged(cProperties, pProperties) {
        result := ComCall(5, this, "int", cProperties, "ptr", pProperties, "HRESULT")
        return result
    }
}
