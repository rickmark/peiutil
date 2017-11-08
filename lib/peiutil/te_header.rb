module PeiUtil
  class TeHeader
    TE_HEADER_MAGIC = 0x5A56 # 'VZ'

    IMAGE_FILE_MACHINE_I386 = 0x014C
    IMAGE_FILE_MACHINE_IA64 = 0x0200
    IMAGE_FILE_MACHINE_AMD64 = 0x8664

    IMAGE_SUBSYSTEM_EFI_APPLICATION = 0xA
    IMAGE_SUBSYSTEM_EFI_BOOT_SERVICE_DRIVER = 0xB
    IMAGE_SUBSYSTEM_EFI_RUNTIME_DRIVER = 0xC
    IMAGE_SUBSYSTEM_EFI_ROM = 0xD

    attr_reader :machine, :subsystem, :sections, :entry_point

    def initialize(data)
      magic = data.unpack 'S'

      raise 'Magic not valid' unless magic == TE_HEADER_MAGIC

      @machine = data.unpack 'S'

      number_of_sections = data.unpack 'C'
      @subsystem = data.unpack 'C'
      stripped_size = unpack 'S'
      @entry_point = data.unpack 'L'
      @code_base = data.unpack 'L'
      @image_base = data.unpack 'Q'


    end
  end
end