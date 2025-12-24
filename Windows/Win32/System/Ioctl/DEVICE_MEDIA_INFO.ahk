#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides information about the media supported by a device.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-device_media_info
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DEVICE_MEDIA_INFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    class _DeviceSpecific_e__Union extends Win32Struct {
        static sizeof => 36
        static packingSize => 8

        class _DiskInfo extends Win32Struct {
            static sizeof => 32
            static packingSize => 8
    
            /**
             * @type {Integer}
             */
            Cylinders {
                get => NumGet(this, 0, "int64")
                set => NumPut("int64", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            MediaType {
                get => NumGet(this, 8, "int")
                set => NumPut("int", value, this, 8)
            }
        
            /**
             * @type {Integer}
             */
            TracksPerCylinder {
                get => NumGet(this, 12, "uint")
                set => NumPut("uint", value, this, 12)
            }
        
            /**
             * @type {Integer}
             */
            SectorsPerTrack {
                get => NumGet(this, 16, "uint")
                set => NumPut("uint", value, this, 16)
            }
        
            /**
             * @type {Integer}
             */
            BytesPerSector {
                get => NumGet(this, 20, "uint")
                set => NumPut("uint", value, this, 20)
            }
        
            /**
             * @type {Integer}
             */
            NumberMediaSides {
                get => NumGet(this, 24, "uint")
                set => NumPut("uint", value, this, 24)
            }
        
            /**
             * @type {Integer}
             */
            MediaCharacteristics {
                get => NumGet(this, 28, "uint")
                set => NumPut("uint", value, this, 28)
            }
        
        }
    
        class _RemovableDiskInfo extends Win32Struct {
            static sizeof => 32
            static packingSize => 8
    
            /**
             * @type {Integer}
             */
            Cylinders {
                get => NumGet(this, 0, "int64")
                set => NumPut("int64", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            MediaType {
                get => NumGet(this, 8, "int")
                set => NumPut("int", value, this, 8)
            }
        
            /**
             * @type {Integer}
             */
            TracksPerCylinder {
                get => NumGet(this, 12, "uint")
                set => NumPut("uint", value, this, 12)
            }
        
            /**
             * @type {Integer}
             */
            SectorsPerTrack {
                get => NumGet(this, 16, "uint")
                set => NumPut("uint", value, this, 16)
            }
        
            /**
             * @type {Integer}
             */
            BytesPerSector {
                get => NumGet(this, 20, "uint")
                set => NumPut("uint", value, this, 20)
            }
        
            /**
             * @type {Integer}
             */
            NumberMediaSides {
                get => NumGet(this, 24, "uint")
                set => NumPut("uint", value, this, 24)
            }
        
            /**
             * @type {Integer}
             */
            MediaCharacteristics {
                get => NumGet(this, 28, "uint")
                set => NumPut("uint", value, this, 28)
            }
        
        }
    
        class _TapeInfo extends Win32Struct {
            static sizeof => 20
            static packingSize => 4
    
            class _BusSpecificData_e__Union extends Win32Struct {
                static sizeof => 2
                static packingSize => 1
        
                class _ScsiInformation extends Win32Struct {
                    static sizeof => 2
                    static packingSize => 1
            
                    /**
                     * @type {Integer}
                     */
                    MediumType {
                        get => NumGet(this, 0, "char")
                        set => NumPut("char", value, this, 0)
                    }
                
                    /**
                     * @type {Integer}
                     */
                    DensityCode {
                        get => NumGet(this, 1, "char")
                        set => NumPut("char", value, this, 1)
                    }
                
                }
            
                /**
                 * @type {_ScsiInformation}
                 */
                ScsiInformation{
                    get {
                        if(!this.HasProp("__ScsiInformation"))
                            this.__ScsiInformation := %this.__Class%._ScsiInformation(0, this)
                        return this.__ScsiInformation
                    }
                }
            
            }
        
            /**
             * @type {Integer}
             */
            MediaType {
                get => NumGet(this, 0, "int")
                set => NumPut("int", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            MediaCharacteristics {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }
        
            /**
             * @type {Integer}
             */
            CurrentBlockSize {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }
        
            /**
             * @type {Integer}
             */
            BusType {
                get => NumGet(this, 12, "int")
                set => NumPut("int", value, this, 12)
            }
        
            /**
             * @type {_BusSpecificData_e__Union}
             */
            BusSpecificData{
                get {
                    if(!this.HasProp("__BusSpecificData"))
                        this.__BusSpecificData := %this.__Class%._BusSpecificData_e__Union(16, this)
                    return this.__BusSpecificData
                }
            }
        
        }
    
        /**
         * @type {_DiskInfo}
         */
        DiskInfo{
            get {
                if(!this.HasProp("__DiskInfo"))
                    this.__DiskInfo := %this.__Class%._DiskInfo(0, this)
                return this.__DiskInfo
            }
        }
    
        /**
         * @type {_RemovableDiskInfo}
         */
        RemovableDiskInfo{
            get {
                if(!this.HasProp("__RemovableDiskInfo"))
                    this.__RemovableDiskInfo := %this.__Class%._RemovableDiskInfo(0, this)
                return this.__RemovableDiskInfo
            }
        }
    
        /**
         * @type {_TapeInfo}
         */
        TapeInfo{
            get {
                if(!this.HasProp("__TapeInfo"))
                    this.__TapeInfo := %this.__Class%._TapeInfo(0, this)
                return this.__TapeInfo
            }
        }
    
    }

    /**
     * A union that contains the following members.
     * @type {_DeviceSpecific_e__Union}
     */
    DeviceSpecific{
        get {
            if(!this.HasProp("__DeviceSpecific"))
                this.__DeviceSpecific := %this.__Class%._DeviceSpecific_e__Union(0, this)
            return this.__DeviceSpecific
        }
    }
}
