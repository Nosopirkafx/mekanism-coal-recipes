package dev.coalsynthesis;

import net.minecraft.resources.ResourceLocation;
import net.minecraft.world.item.Item;
import net.neoforged.bus.api.IEventBus;
import net.neoforged.fml.common.Mod;
import net.neoforged.neoforge.event.BuildCreativeModeTabContentsEvent;
import net.neoforged.neoforge.registries.DeferredItem;
import net.neoforged.neoforge.registries.DeferredRegister;

@Mod(CoalSynthesis.MOD_ID)
public final class CoalSynthesis {
    public static final String MOD_ID = "mek_coal_synthesis";
    private static final DeferredRegister.Items ITEMS = DeferredRegister.createItems(MOD_ID);
    public static final DeferredItem<Item> COAL_CLUMP = ITEMS.registerSimpleItem("clump_coal");

    public CoalSynthesis(IEventBus bus) {
        ITEMS.register(bus);
        bus.addListener(CoalSynthesis::addCreativeItem);
    }

    private static void addCreativeItem(BuildCreativeModeTabContentsEvent event) {
        if (event.getTabKey().location().equals(ResourceLocation.withDefaultNamespace("ingredients"))) {
            event.accept(COAL_CLUMP);
        }
    }
}
