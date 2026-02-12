#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\ApplicationModel\Package.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class IPackageVolume extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPackageVolume
     * @type {Guid}
     */
    static IID => Guid("{cf2672c3-1a40-4450-9739-2ace2e898853}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsOffline", "get_IsSystemVolume", "get_MountPoint", "get_Name", "get_PackageStorePath", "get_SupportsHardLinks", "FindPackages", "FindPackagesByNamePublisher", "FindPackagesByPackageFamilyName", "FindPackagesWithPackageTypes", "FindPackagesByNamePublisherWithPackagesTypes", "FindPackagesByPackageFamilyNameWithPackageTypes", "FindPackageByPackageFullName", "FindPackagesByUserSecurityId", "FindPackagesByUserSecurityIdNamePublisher", "FindPackagesByUserSecurityIdPackageFamilyName", "FindPackagesByUserSecurityIdWithPackageTypes", "FindPackagesByUserSecurityIdNamePublisherWithPackageTypes", "FindPackagesByUserSecurityIdPackageFamilyNameWithPackagesTypes", "FindPackageByUserSecurityIdPackageFullName"]

    /**
     * @type {Boolean} 
     */
    IsOffline {
        get => this.get_IsOffline()
    }

    /**
     * @type {Boolean} 
     */
    IsSystemVolume {
        get => this.get_IsSystemVolume()
    }

    /**
     * @type {HSTRING} 
     */
    MountPoint {
        get => this.get_MountPoint()
    }

    /**
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {HSTRING} 
     */
    PackageStorePath {
        get => this.get_PackageStorePath()
    }

    /**
     * @type {Boolean} 
     */
    SupportsHardLinks {
        get => this.get_SupportsHardLinks()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOffline() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSystemVolume() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MountPoint() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PackageStorePath() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SupportsHardLinks() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Finds the packages with the specified family name for the current user.
     * @returns {IVector<Package>} 
     * @see https://learn.microsoft.com/windows/win32/api//content/appmodel/nf-appmodel-findpackagesbypackagefamily
     */
    FindPackages() {
        result := ComCall(12, this, "ptr*", &packageCollection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Package, packageCollection)
    }

    /**
     * Finds the packages with the specified family name for the current user.
     * @param {HSTRING} packageName 
     * @param {HSTRING} packagePublisher 
     * @returns {IVector<Package>} 
     * @see https://learn.microsoft.com/windows/win32/api//content/appmodel/nf-appmodel-findpackagesbypackagefamily
     */
    FindPackagesByNamePublisher(packageName, packagePublisher) {
        if(packageName is String) {
            pin := HSTRING.Create(packageName)
            packageName := pin.Value
        }
        packageName := packageName is Win32Handle ? NumGet(packageName, "ptr") : packageName
        if(packagePublisher is String) {
            pin := HSTRING.Create(packagePublisher)
            packagePublisher := pin.Value
        }
        packagePublisher := packagePublisher is Win32Handle ? NumGet(packagePublisher, "ptr") : packagePublisher

        result := ComCall(13, this, "ptr", packageName, "ptr", packagePublisher, "ptr*", &packageCollection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Package, packageCollection)
    }

    /**
     * Finds the packages with the specified family name for the current user.
     * @param {HSTRING} packageFamilyName Type: <b>PCWSTR</b>
     * 
     * The package family name.
     * @returns {IVector<Package>} 
     * @see https://learn.microsoft.com/windows/win32/api//content/appmodel/nf-appmodel-findpackagesbypackagefamily
     */
    FindPackagesByPackageFamilyName(packageFamilyName) {
        if(packageFamilyName is String) {
            pin := HSTRING.Create(packageFamilyName)
            packageFamilyName := pin.Value
        }
        packageFamilyName := packageFamilyName is Win32Handle ? NumGet(packageFamilyName, "ptr") : packageFamilyName

        result := ComCall(14, this, "ptr", packageFamilyName, "ptr*", &packageCollection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Package, packageCollection)
    }

    /**
     * 
     * @param {Integer} packageTypes_ 
     * @returns {IVector<Package>} 
     */
    FindPackagesWithPackageTypes(packageTypes_) {
        result := ComCall(15, this, "uint", packageTypes_, "ptr*", &packageCollection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Package, packageCollection)
    }

    /**
     * 
     * @param {Integer} packageTypes_ 
     * @param {HSTRING} packageName 
     * @param {HSTRING} packagePublisher 
     * @returns {IVector<Package>} 
     */
    FindPackagesByNamePublisherWithPackagesTypes(packageTypes_, packageName, packagePublisher) {
        if(packageName is String) {
            pin := HSTRING.Create(packageName)
            packageName := pin.Value
        }
        packageName := packageName is Win32Handle ? NumGet(packageName, "ptr") : packageName
        if(packagePublisher is String) {
            pin := HSTRING.Create(packagePublisher)
            packagePublisher := pin.Value
        }
        packagePublisher := packagePublisher is Win32Handle ? NumGet(packagePublisher, "ptr") : packagePublisher

        result := ComCall(16, this, "uint", packageTypes_, "ptr", packageName, "ptr", packagePublisher, "ptr*", &packageCollection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Package, packageCollection)
    }

    /**
     * 
     * @param {Integer} packageTypes_ 
     * @param {HSTRING} packageFamilyName 
     * @returns {IVector<Package>} 
     */
    FindPackagesByPackageFamilyNameWithPackageTypes(packageTypes_, packageFamilyName) {
        if(packageFamilyName is String) {
            pin := HSTRING.Create(packageFamilyName)
            packageFamilyName := pin.Value
        }
        packageFamilyName := packageFamilyName is Win32Handle ? NumGet(packageFamilyName, "ptr") : packageFamilyName

        result := ComCall(17, this, "uint", packageTypes_, "ptr", packageFamilyName, "ptr*", &packageCollection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Package, packageCollection)
    }

    /**
     * Finds the packages with the specified family name for the current user.
     * @param {HSTRING} packageFullName 
     * @returns {IVector<Package>} 
     * @see https://learn.microsoft.com/windows/win32/api//content/appmodel/nf-appmodel-findpackagesbypackagefamily
     */
    FindPackageByPackageFullName(packageFullName) {
        if(packageFullName is String) {
            pin := HSTRING.Create(packageFullName)
            packageFullName := pin.Value
        }
        packageFullName := packageFullName is Win32Handle ? NumGet(packageFullName, "ptr") : packageFullName

        result := ComCall(18, this, "ptr", packageFullName, "ptr*", &packageCollection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Package, packageCollection)
    }

    /**
     * 
     * @param {HSTRING} userSecurityId 
     * @returns {IVector<Package>} 
     */
    FindPackagesByUserSecurityId(userSecurityId) {
        if(userSecurityId is String) {
            pin := HSTRING.Create(userSecurityId)
            userSecurityId := pin.Value
        }
        userSecurityId := userSecurityId is Win32Handle ? NumGet(userSecurityId, "ptr") : userSecurityId

        result := ComCall(19, this, "ptr", userSecurityId, "ptr*", &packageCollection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Package, packageCollection)
    }

    /**
     * 
     * @param {HSTRING} userSecurityId 
     * @param {HSTRING} packageName 
     * @param {HSTRING} packagePublisher 
     * @returns {IVector<Package>} 
     */
    FindPackagesByUserSecurityIdNamePublisher(userSecurityId, packageName, packagePublisher) {
        if(userSecurityId is String) {
            pin := HSTRING.Create(userSecurityId)
            userSecurityId := pin.Value
        }
        userSecurityId := userSecurityId is Win32Handle ? NumGet(userSecurityId, "ptr") : userSecurityId
        if(packageName is String) {
            pin := HSTRING.Create(packageName)
            packageName := pin.Value
        }
        packageName := packageName is Win32Handle ? NumGet(packageName, "ptr") : packageName
        if(packagePublisher is String) {
            pin := HSTRING.Create(packagePublisher)
            packagePublisher := pin.Value
        }
        packagePublisher := packagePublisher is Win32Handle ? NumGet(packagePublisher, "ptr") : packagePublisher

        result := ComCall(20, this, "ptr", userSecurityId, "ptr", packageName, "ptr", packagePublisher, "ptr*", &packageCollection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Package, packageCollection)
    }

    /**
     * 
     * @param {HSTRING} userSecurityId 
     * @param {HSTRING} packageFamilyName 
     * @returns {IVector<Package>} 
     */
    FindPackagesByUserSecurityIdPackageFamilyName(userSecurityId, packageFamilyName) {
        if(userSecurityId is String) {
            pin := HSTRING.Create(userSecurityId)
            userSecurityId := pin.Value
        }
        userSecurityId := userSecurityId is Win32Handle ? NumGet(userSecurityId, "ptr") : userSecurityId
        if(packageFamilyName is String) {
            pin := HSTRING.Create(packageFamilyName)
            packageFamilyName := pin.Value
        }
        packageFamilyName := packageFamilyName is Win32Handle ? NumGet(packageFamilyName, "ptr") : packageFamilyName

        result := ComCall(21, this, "ptr", userSecurityId, "ptr", packageFamilyName, "ptr*", &packageCollection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Package, packageCollection)
    }

    /**
     * 
     * @param {HSTRING} userSecurityId 
     * @param {Integer} packageTypes_ 
     * @returns {IVector<Package>} 
     */
    FindPackagesByUserSecurityIdWithPackageTypes(userSecurityId, packageTypes_) {
        if(userSecurityId is String) {
            pin := HSTRING.Create(userSecurityId)
            userSecurityId := pin.Value
        }
        userSecurityId := userSecurityId is Win32Handle ? NumGet(userSecurityId, "ptr") : userSecurityId

        result := ComCall(22, this, "ptr", userSecurityId, "uint", packageTypes_, "ptr*", &packageCollection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Package, packageCollection)
    }

    /**
     * 
     * @param {HSTRING} userSecurityId 
     * @param {Integer} packageTypes_ 
     * @param {HSTRING} packageName 
     * @param {HSTRING} packagePublisher 
     * @returns {IVector<Package>} 
     */
    FindPackagesByUserSecurityIdNamePublisherWithPackageTypes(userSecurityId, packageTypes_, packageName, packagePublisher) {
        if(userSecurityId is String) {
            pin := HSTRING.Create(userSecurityId)
            userSecurityId := pin.Value
        }
        userSecurityId := userSecurityId is Win32Handle ? NumGet(userSecurityId, "ptr") : userSecurityId
        if(packageName is String) {
            pin := HSTRING.Create(packageName)
            packageName := pin.Value
        }
        packageName := packageName is Win32Handle ? NumGet(packageName, "ptr") : packageName
        if(packagePublisher is String) {
            pin := HSTRING.Create(packagePublisher)
            packagePublisher := pin.Value
        }
        packagePublisher := packagePublisher is Win32Handle ? NumGet(packagePublisher, "ptr") : packagePublisher

        result := ComCall(23, this, "ptr", userSecurityId, "uint", packageTypes_, "ptr", packageName, "ptr", packagePublisher, "ptr*", &packageCollection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Package, packageCollection)
    }

    /**
     * 
     * @param {HSTRING} userSecurityId 
     * @param {Integer} packageTypes_ 
     * @param {HSTRING} packageFamilyName 
     * @returns {IVector<Package>} 
     */
    FindPackagesByUserSecurityIdPackageFamilyNameWithPackagesTypes(userSecurityId, packageTypes_, packageFamilyName) {
        if(userSecurityId is String) {
            pin := HSTRING.Create(userSecurityId)
            userSecurityId := pin.Value
        }
        userSecurityId := userSecurityId is Win32Handle ? NumGet(userSecurityId, "ptr") : userSecurityId
        if(packageFamilyName is String) {
            pin := HSTRING.Create(packageFamilyName)
            packageFamilyName := pin.Value
        }
        packageFamilyName := packageFamilyName is Win32Handle ? NumGet(packageFamilyName, "ptr") : packageFamilyName

        result := ComCall(24, this, "ptr", userSecurityId, "uint", packageTypes_, "ptr", packageFamilyName, "ptr*", &packageCollection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Package, packageCollection)
    }

    /**
     * 
     * @param {HSTRING} userSecurityId 
     * @param {HSTRING} packageFullName 
     * @returns {IVector<Package>} 
     */
    FindPackageByUserSecurityIdPackageFullName(userSecurityId, packageFullName) {
        if(userSecurityId is String) {
            pin := HSTRING.Create(userSecurityId)
            userSecurityId := pin.Value
        }
        userSecurityId := userSecurityId is Win32Handle ? NumGet(userSecurityId, "ptr") : userSecurityId
        if(packageFullName is String) {
            pin := HSTRING.Create(packageFullName)
            packageFullName := pin.Value
        }
        packageFullName := packageFullName is Win32Handle ? NumGet(packageFullName, "ptr") : packageFullName

        result := ComCall(25, this, "ptr", userSecurityId, "ptr", packageFullName, "ptr*", &packageCollection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Package, packageCollection)
    }
}
